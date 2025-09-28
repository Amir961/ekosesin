
import 'package:fare/core/res/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/components/text/text.dart';
import '../../../../core/utils/values.dart';
import '../../domain/entity/app_language.dart';
import '../bloc/app_language_bloc.dart';

class LanguageDropDownWidget extends StatelessWidget {
  const LanguageDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppLanguageBloc,AppLanguageState>(
        builder: (context,state) {


          return StatefulBuilder(
              builder: (contextState, menuSetState) {
                return   DropdownButtonHideUnderline(

                  child: DropdownButton2<AppLanguage>(

                    isExpanded: true,



                    items: state.getLanguageList
                        .map((AppLanguage item) => DropdownMenuItem<AppLanguage>(
                      value: item,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          MyText(
                            text: item.language.toUpperCase(),

                            fontSize: 14,
                            fontWeight: FontWeight.bold,


                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10,),
                          SvgPicture.asset(item.iconSvg,height: 18,)
                        ],
                      ),
                    ))
                        .toList(),
                    value: state.language,
                    onChanged: (language) {

                      BlocProvider.of<AppLanguageBloc>(context)
                          .add(SetAppLanguageEvent(tag: language?.language??''));

                    },

                    iconStyleData: IconStyleData(
                      icon:  SizedBox(),
                      iconSize: 0,
                      iconEnabledColor: Colors.grey[800],
                      iconDisabledColor: Colors.grey,
                    ),
                    buttonStyleData: ButtonStyleData(
                      height: 40,
                      width: 70,
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


                      width: 70,
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
                    menuItemStyleData:  MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),


                  ),
                );




              }
          );


          // return ListView.builder(
          //     shrinkWrap: true,
          //     padding: const EdgeInsets.only(top: 8, bottom: 8),
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: state.getLanguageList.length ,
          //     itemBuilder: (context, index) =>
          //         LanguageItemWidget(
          //           isProfile: widget.isProfile,
          //           isSelected:
          //           state.getLanguageList[index].language ==
          //               state.language.language,
          //           language: state.getLanguageList[index],
          //         )
          //
          // );
        }
    );
  }
}
