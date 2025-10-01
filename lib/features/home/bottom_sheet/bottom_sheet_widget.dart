

import 'package:fare/core/components/dialog/dialog_manager.dart';
import 'package:fare/core/components/inherited/tablet_checker/app_provider.dart';
import 'package:fare/core/components/text/text.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:fare/core/utils/values.dart';
import 'package:fare/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/icon/svg_assets.dart';
import '../../../injection_container.dart';
import '../../language/utils/strings.dart';

class ButtomSheetWidget extends StatefulWidget {
  final Function changeCategory;
  const ButtomSheetWidget({required this.changeCategory,super.key});

  @override
  State<ButtomSheetWidget> createState() => _ButtomSheetWidgetState();
}

class _ButtomSheetWidgetState extends State<ButtomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = AppProvider.of(context).isDark;
    final backGroundColor = isDark ? Colors.black : Colors.white;
    return
      SizedBox(
        width: double.infinity,
        height: 70,
        child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 50,

              decoration: BoxDecoration(
                color: backGroundColor,

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: (){



                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgAssets(
                          address:  MediaRes.house,


                          ),
                          MyText(text: Strings.of(context).home_label )
                        ],
                      )


                  ),
                  InkWell(
                      onTap: (){



                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgAssets(
                           address:  MediaRes.building,


                          ),
                          MyText(text: Strings.of(context).businesses_label)
                        ],
                      )


                  ),
                  SizedBox(),
                  InkWell(
                      onTap: ()async{

                      final result= await  sl<DialogManager>().showSelectCategorySheet(context: context);
                      widget.changeCategory.call();



                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgAssets(
                          address:   MediaRes.layoutGrid,


                          ),
                          MyText(text: Strings.of(context).categories_label )
                        ],
                      )


                  ),
                  InkWell(
                      onTap: (){



                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgAssets(
                           address:  MediaRes.user,


                          ),
                          MyText(text: Strings.of(context).profile_label )
                        ],
                      )


                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
                onTap: (){



                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue
                      ),
                      child: SvgPicture.asset(
                        MediaRes.circlePlus,


                      ),
                    ),
                    MyText(text: Strings.of(context).register_ads_label )
                  ],
                )


            ),
          ),
        ],
            ),
      );
  }
}
