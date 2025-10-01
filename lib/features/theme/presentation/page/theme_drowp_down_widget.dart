
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/text/text.dart';
import '../../../../core/res/constant.dart';
import '../../domain/entity/app_theme.dart';
import '../bloc/app_theme_bloc.dart';

class ThemeDrowpDownWidget extends StatelessWidget {
  const ThemeDrowpDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) =>

       DropdownButtonHideUnderline(

    child: DropdownButton2<AppTheme>(

    isExpanded: true,



      items: state.getThemeList
          .map((AppTheme item) => DropdownMenuItem<AppTheme>(
        value: item,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MyText(
              text: item.theme.name.toUpperCase(),

              fontSize: 14,
              fontWeight: FontWeight.bold,


              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: 10,),
            //SvgPicture.asset(item.iconSvg,height: 18,)
          ],
        ),
      ))
          .toList(),
      value: state.theme,
      onChanged: (theme) {


        BlocProvider.of<AppThemeBloc>(context)
            .add(SetAppThemeEvent(themeMode: theme!.theme));

      },

      iconStyleData: IconStyleData(
        icon:  SizedBox(),
        iconSize: 0,
        iconEnabledColor: Colors.grey[800],
        iconDisabledColor: Colors.grey,
      ),
      buttonStyleData: ButtonStyleData(
        height: 40,
        width: 150,
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


        width: 150,
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
    )


      //     ListView.builder(
      //     shrinkWrap: true,
      //     padding: const EdgeInsets.only(top: 8, bottom: 8),
      //     physics: const NeverScrollableScrollPhysics(),
      //     itemCount: state.getThemeList.length ,
      //     itemBuilder: (context, index) =>
      //         ThemeItemWidget(
      //           isSelected: state.getThemeList[index].id == state.theme.id,
      //           theme: state.getThemeList[index],
      //         )
      //
      // ),
    );
  }
}
