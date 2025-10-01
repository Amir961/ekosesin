import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fare/core/components/dialog/dialog_manager.dart';
import 'package:fare/core/components/loading/loading_widget.dart';
import 'package:fare/core/components/text/text.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:fare/core/utils/enum.dart';
import 'package:fare/features/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/empty_list/empty.dart';
import '../../../core/components/icon/svg_assets.dart';
import '../../../core/components/inherited/tablet_checker/app_provider.dart';
import '../../../core/components/menu_bar.dart';
import '../../../core/res/constant.dart';
import '../../../core/utils/temp_function.dart';
import '../../../injection_container.dart';
import '../../language/utils/strings.dart';
import '../bloc/category_bloc.dart' as catBloc;
import '../bloc/city_bloc.dart' as citBloc;
import '../bloc/home_bloc.dart';
import '../bloc/sorted_bloc.dart';
import '../bottom_sheet/bottom_sheet_widget.dart';
import '../bottom_sheet/header_widget.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(true);
    getDataCategory();
  }

  getData(bool isFirst, {String? searchValue}) {
    Map<String, dynamic> variables = {};
    if (searchValue != null) {
      variables.addAll({"search": searchValue});
    }

    //category_id
    if (BlocProvider.of<catBloc.CategoryBloc>(context)
        .state
        .queenList
        .isNotEmpty) {
      variables.addAll({
        "category_id": BlocProvider.of<catBloc.CategoryBloc>(context)
            .state
            .queenList
            .last
            .id
      });
    }

    if (BlocProvider.of<citBloc.CityBloc>(context).state.selectedCity != null &&
        BlocProvider.of<citBloc.CityBloc>(context).state.selectedCity?.id !=
            -1) {
      variables.addAll({
        "city_id":
            BlocProvider.of<citBloc.CityBloc>(context).state.selectedCity?.id
      });
    }

    final c = BlocProvider.of<SortedBloc>(context).state.selectedSortedClass;
    variables.addAll({"sort_by": c.sortBy});
    variables.addAll({"sort_dir": c.sortDir});

    BlocProvider.of<HomeBloc>(context).add(GetDataEvent(variables));
  }

  getDataCategory() {
    Map<String, dynamic> variables = {};
    variables.addAll({"with_children": true});
    variables.addAll({"lang": globalLanguageId});
    if (BlocProvider.of<citBloc.CityBloc>(context).state.selectedCity != null &&
        BlocProvider.of<citBloc.CityBloc>(context).state.selectedCity?.id !=
            -1) {
      variables.addAll({
        "city_id":
            BlocProvider.of<citBloc.CityBloc>(context).state.selectedCity?.id
      });
    }
    BlocProvider.of<catBloc.CategoryBloc>(context)
        .add(catBloc.GetDataEvent(variables));
  }



  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;
    return Scaffold(

        key: scaffoldKey,
        endDrawer:

        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(0),   // گوشه بالا راست
            bottomRight: Radius.circular(0),// گوشه پایین راست
          ),
          child: Drawer(
               backgroundColor: Theme.of(context).brightness == Brightness.dark? Colors.black:Colors.white ,
              child: MenuBarWidget()


          ),
        ),

        body: SafeArea(
            child: Column(
          children: [
            HeaderWidget(
              hint: Strings.of(context).hint_search_header_label,
              changeSearch: (String value) {
                getData(true, searchValue: value);
              },
            ),
            _category,
            Expanded(child: _list),
          ],
        )),
        bottomNavigationBar: ButtomSheetWidget(
          changeCategory: () {
            getData(true);
          },
        ));
  }

  Widget get _list => BlocListener<citBloc.CityBloc, citBloc.CityState>(
      listenWhen: (previous, current) =>
          (previous.selectedCity != current.selectedCity) &&
          previous.selectedCity != null,
      listener: (BuildContext context, state) {
        debugPrint('change_city: ${state.selectedCity?.id}');
        getData(true);
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.statusButton != current.statusButton,
        listener: (BuildContext context, HomeState state) {
          if (state.statusButton == StatusButton.noInternet) {
            sl<DialogManager>().showNoNetDialog(
                context: context,
                onTryAgainClick: () {
                  getData(false);
                });
          }
          if (state.statusButton == StatusButton.failed) {
            sl<DialogManager>().showErrorDialog(
                context: context,
                onTryAgainClick: () {
                  getData(false);
                },
                message: state.message);
          }
        },
        buildWhen: (previous, current) =>
            previous.statusButton != current.statusButton,
        builder: (context, state) {
          debugPrint('state_home_is: ${state.toString()}');

          return state.statusButton == StatusButton.loading
              ? LoadingWidget()
              : RefreshIndicator(
                  onRefresh: () async {
                    getData(true);
                  },
                  child: state.listProduct.isEmpty?
                  EmptyWidget()
                  
                  :ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 12, left: 12),
                    itemCount: state.listProduct.length,
                    itemBuilder: (context, index) =>
                        _product(state.listProduct[index]),
                  ),
                );
        },
      ));

  Widget _product(Product product) {
    String getImageUrl() {
      // return 'https://ekosesin.com/fa/posters/${product.url}';
      if (product.images!.isNotEmpty) {
        if (product.images!.first.cfUrl != null) {
          return product.images!.first.cfUrl ?? '';
        } else {
          if (product.images!.first.extra != null) {
            return product.images!.first.extra!.values.first;
          }
        }
      }
      return '';
    }

    //https://ekosesin.com/fa/posters/7391/siyah-pc-7391
    //https://ekosesin.com/_next/image?url=https%3A%2F%2Fcf-img.ekosesin.com%2Fposter%2F7391%2F17581822025534.jpg%2Fmax300&w=1920&q=75

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backGroundColor = isDark ? Colors.black : Colors.white;
    return Container(
      width: double.infinity,
      height: 130,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(radiusContainer),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:  BorderRadius.only(topRight: Radius.circular(AppProvider.of(context).isRightToLeft?radiusContainer:0),bottomRight: Radius.circular(AppProvider.of(context).isRightToLeft?radiusContainer:0),topLeft: Radius.circular(!AppProvider.of(context).isRightToLeft?radiusContainer:0),bottomLeft: Radius.circular(!AppProvider.of(context).isRightToLeft?radiusContainer:0)),
            child: CachedNetworkImage(
                width: 130,
                height: 130,
                fit: BoxFit.fill,
                imageUrl: getImageUrl()),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: product.translateTitle(),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                MyText(
                    text:
                        '${product.currency?.sign} ${changePrice(product.price ?? 0)}'),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SvgAssets(
                      address: MediaRes.map,
                      height: 16,
                      width: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyText(text: product.city?.translateTitle() ?? ''),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     MyText(
                                           text: product.createdAt?.split('T')[0] ?? '',
                                           fontSize: 12,
                                         ),
                    SizedBox(width: 4,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[200]),
                        child: Center(
                            child: MyText(
                          text: product.category?.translateTitle() ?? '',
                          fontSize: 11,
                        )),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  String getTitleSorted(int index) {
    if (index == 0) {
      return Strings.of(context).newest_label;
    } else if (index == 1) {
      return Strings.of(context).oldest_label;
    }
    if (index == 2) {
      return Strings.of(context).title_asc_label;
    }
    if (index == 3) {
      return Strings.of(context).title_desc_label;
    }
    if (index == 4) {
      return Strings.of(context).price_lowest_label;
    }
    if (index == 5) {
      return Strings.of(context).price_highest_label;
    } else
      return '';
  }

  Widget get _category => Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(radiusContainer)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BlocConsumer<catBloc.CategoryBloc, catBloc.CategoryState>(
                listenWhen: (previous, current) =>
                    previous.statusButton != current.statusButton,
                listener: (BuildContext context, state) {
                  if (state.statusButton == StatusButton.noInternet) {
                    sl<DialogManager>().showNoNetDialog(
                        context: context,
                        onTryAgainClick: () {
                          getDataCategory();
                        });
                  } else if (state.statusButton == StatusButton.success) {
                   // getData(true);
                  } else if (state.statusButton == StatusButton.failed) {
                    sl<DialogManager>().showErrorDialog(
                        context: context,
                        onTryAgainClick: () {
                          getDataCategory();
                        },
                        message: state.message);
                  }
                },
                buildWhen: (previous, current) =>
                    previous.statusButton != current.statusButton,
                builder: (context, state) {
                  debugPrint('state_home_is: ${state.toString()}');

                  return state.statusButton == StatusButton.loading
                      ? LoadingWidget()
                      : MyText(
                          text: state.queenList.isEmpty
                              ? Strings.of(context).description_sorted
                              : state.queenList.last.translateMetaTitle());
                },
              ),
            ),
            BlocConsumer<SortedBloc, SortedState>(
              listener: (BuildContext context, SortedState state) {
                getData(true);
              },
              listenWhen: (previous, current) =>
                  (previous.selectedSortedClass != current.selectedSortedClass),
              buildWhen: (previous, current) =>
                  previous.selectedSortedClass != current.selectedSortedClass,
              builder: (context, state) {
                debugPrint('state_home_is: ${state.toString()}');

                return DropdownButtonHideUnderline(
                  child: DropdownButton2<SortedClass>(
                    isExpanded: true,
                    items: state.list
                        .map(
                            (SortedClass item) => DropdownMenuItem<SortedClass>(
                                  value: item,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyText(
                                        text: getTitleSorted(item.index),
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ))
                        .toList(),
                    value: state.selectedSortedClass,
                    onChanged: (value) {
                      BlocProvider.of<SortedBloc>(context)
                          .add(SetSortedEvent(sortedClass: value!));
                    },
                    iconStyleData: IconStyleData(
                      icon: SizedBox(),
                      iconSize: 0,
                      iconEnabledColor: Colors.grey[800],
                      iconDisabledColor: Colors.grey,
                    ),
                    buttonStyleData: ButtonStyleData(
                      height: 40,
                      width: 140,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        border: Border.all(
                          color: Colors.grey[600]!,
                        ),
                        color: Theme.of(context).canvasColor,
                      ),
                      elevation: 0,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 150,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: Theme.of(context).canvasColor,
                      ),
                      offset: const Offset(0, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(10),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );



}

class SortedClass {
  final int index;
  final String sortBy;
  final String sortDir;

  SortedClass(
      {required this.index, required this.sortBy, required this.sortDir});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortedClass &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => index.hashCode;
}
