
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fare/features/salon/bloc/salon_bloc.dart';
import 'package:fare/features/salon/models/city_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/language/utils/strings.dart';
import '../button/button_widget.dart';
import '../text/text.dart';

class BottomSheetFilterSalon extends StatefulWidget {
  final CityModels? source;
  final CityModels? destination;
  final BuildContext myContext;
  const BottomSheetFilterSalon({required this.myContext,required this.source,required this.destination,super.key});

  @override
  State<BottomSheetFilterSalon> createState() => _BottomSheetFilterSalonState();
}

class _BottomSheetFilterSalonState extends State<BottomSheetFilterSalon> {
  CityModels? initSource;
  CityModels? initDestination;

  double get marginWidth => MediaQuery.of(context).size.width * 0.1;

  double get inputWidth => MediaQuery.of(context).size.width * .9;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

  getData() async
  {
    initSource= widget.source;
    initDestination= widget.destination;

    if(BlocProvider.of<SalonBloc>(widget.myContext).state.listCity.isEmpty) {
      BlocProvider.of<SalonBloc>(widget.myContext).add(
          GetListCity());
    }

    setState(() {

    });
    debugPrint('${widget.destination?.title}--- ${initDestination?.title}--');
  }

  @override
  Widget build(BuildContext context) {
   return BlocProvider.value(
      value: BlocProvider.of<SalonBloc>(widget.myContext),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.clear,
                    size: 30,
                  ),
                ),
                MyText(
                  text: 'فیلتر',
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),



          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
            child: Divider(thickness: .5,color: Colors.grey,),
          ),
          _listSource,
          const SizedBox(height: 20),
          _listDestination,

          const SizedBox(height: 40),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child:  ButtonWidget(

                onClick: () async{
                  BlocProvider.of<SalonBloc>(widget.myContext).add(
                      ChangeFilter(initDestination, initSource));
                  context.pop();
                },
                loading: false,
                text: 'فیلتر کن',
                width: 200,
                fontSize: 16,
                height: 45,
              ),


            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );

  }

 // BlocProvider.of<AuthBloc>(context).add(LoginEvent());

  Widget get _listSource =>
      BlocBuilder<SalonBloc, SalonState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'مبدا را انتخاب کنید',
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              StatefulBuilder(
                  builder: (contextState, menuSetState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<CityModels>(
                        isExpanded: true,
                        hint:
                        Row(
                          children: [
                            const Icon(
                              Icons.location_city_sharp,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: MyText(
                                text: 'مبدا',

                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,

                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: state.listCity
                            .map(
                                (CityModels item) => DropdownMenuItem<CityModels>(
                              value: item,
                              child: MyText(
                                text: item.title??'',


                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,

                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                            .toList(),
                        value: initSource,
                        onChanged: (selectGetTypeImage) {
                          debugPrint('selectGetTypeImage: $selectGetTypeImage');

                          menuSetState(() {
                            initSource=  selectGetTypeImage;
                          });

                        },
                        buttonStyleData: ButtonStyleData(
                          height: 45,
                          width: inputWidth,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: IconStyleData(
                          icon:  InkWell(
                            onTap: (){
                              setState(() {
                                initSource=null;
                              });

                            },
                            child: Icon(
                              Icons.clear,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.grey[800],
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: inputWidth*2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.grey[600],
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 45,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                        // dropdownSearchData: DropdownSearchData(
                        //   //searchController: textEditingController,
                        //   searchInnerWidgetHeight: 50,
                        //   searchInnerWidget: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.only(
                        //       top: 8,
                        //       bottom: 4,
                        //       right: 8,
                        //       left: 8,
                        //     ),
                        //     child: TextFormField(
                        //       expands: true,
                        //       maxLines: null,
                        //       //controller: textEditingController,
                        //       decoration: InputDecoration(
                        //         isDense: true,
                        //         contentPadding: const EdgeInsets.symmetric(
                        //           horizontal: 10,
                        //           vertical: 8,
                        //         ),
                        //         hintText: 'جستجو',
                        //         hintStyle: const TextStyle(fontSize: 12,color: Colors.white),
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(8),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   searchMatchFn: (item, searchValue) {
                        //     return item.value!.title.toString().contains(searchValue);
                        //   },
                        // ),
                      ),
                    );
                  }
              ),
            ],
          ),
        );
      });


  Widget get _listDestination =>
      BlocBuilder<SalonBloc, SalonState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'مقصد را انتخاب کنید',
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              StatefulBuilder(
                  builder: (contextState, menuSetState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<CityModels>(
                        isExpanded: true,
                        hint:
                        Row(
                          children: [
                            const Icon(
                              Icons.location_city_sharp,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: MyText(
                                text: 'مقصد',

                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,

                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: state.listCity
                            .map(
                                (CityModels item) => DropdownMenuItem<CityModels>(
                              value: item,
                              child: MyText(
                                text: item.title??'',


                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,

                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                            .toList(),
                        value: initDestination,
                        onChanged: (selectGetTypeImage) {
                          debugPrint('selectGetTypeImage: $selectGetTypeImage');

                          menuSetState(() {
                            initDestination=  selectGetTypeImage;
                          });

                        },
                        buttonStyleData: ButtonStyleData(
                          height: 45,
                          width: inputWidth,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: IconStyleData(
                          icon:  InkWell(
                            onTap: (){
                              setState(() {
                                initDestination=null;
                              });

                            },
                            child: Icon(
                              Icons.clear,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.grey[800],
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: inputWidth*2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.grey[600],
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 45,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                        // dropdownSearchData: DropdownSearchData(
                        //   //searchController: textEditingController,
                        //   searchInnerWidgetHeight: 50,
                        //   searchInnerWidget: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.only(
                        //       top: 8,
                        //       bottom: 4,
                        //       right: 8,
                        //       left: 8,
                        //     ),
                        //     child: TextFormField(
                        //       expands: true,
                        //       maxLines: null,
                        //       //controller: textEditingController,
                        //       decoration: InputDecoration(
                        //         isDense: true,
                        //         contentPadding: const EdgeInsets.symmetric(
                        //           horizontal: 10,
                        //           vertical: 8,
                        //         ),
                        //         hintText: 'جستجو',
                        //         hintStyle: const TextStyle(fontSize: 12,color: Colors.white),
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(8),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   searchMatchFn: (item, searchValue) {
                        //     return item.value!.title.toString().contains(searchValue);
                        //   },
                        // ),
                      ),
                    );
                  }
              ),
            ],
          ),
        );
      });
}
