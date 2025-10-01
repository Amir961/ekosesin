
import 'dart:async';

import 'package:fare/core/components/inherited/tablet_checker/app_provider.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/icon/svg_assets.dart';
import '../../../core/components/input/input.dart';
import '../../../core/components/input/search_input.dart';
import '../../../core/res/constant.dart';
import '../../language/presentation/widget/language_drop_down_widget.dart';
import '../../language/utils/strings.dart';
import '../bloc/city_bloc.dart';
import '../pages/home_screen.dart';
import 'city_widget.dart';

class HeaderWidget extends StatefulWidget {
  final String hint;
  final Function(String) changeSearch;
  const HeaderWidget({required this.hint,required this.changeSearch,super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  TextEditingController searchEditingController = TextEditingController();

  Timer? _debounce;


  @override
  Widget build(BuildContext context) {
    final isDark = AppProvider.of(context).isDark ;
    final backGroundColor = isDark ? Colors.black : Colors.white;
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: backGroundColor
      ),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: horizontalPaddingHeader),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              scaffoldKey.currentState?.openEndDrawer();
            },
            child: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(7),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(radius),
                border: Border.all(color: Colors.grey[600]!)
              ),
              child: SvgAssets(address: MediaRes.menu,height: 24,width: 24,),
            ),
          ),
          SizedBox(width: 3,),
           Expanded(child:
           SearchInput(
             width: double.infinity, controller: searchEditingController,
             perfixIcon: Icon(Icons.search),
             hintText: widget.hint,
             textAlignVertical: TextAlignVertical.center,
             onChange: (String value){

               if (_debounce?.isActive ?? false) _debounce!.cancel();

               // مثلا 2 ثانیه بعد از آخرین تغییر، درخواست API می‌زنیم
               _debounce = Timer(const Duration(seconds: 2), () {

                   widget.changeSearch(value);

               });


             },

           )),
           SizedBox(width: 3,),

            CityWidget()
        ],
      ),
    );
  }
}
