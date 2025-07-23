

import 'package:fare/core/components/text/text.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:fare/core/utils/values.dart';
import 'package:fare/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ButtomSheetWidget extends StatefulWidget {
  const ButtomSheetWidget({super.key});

  @override
  State<ButtomSheetWidget> createState() => _ButtomSheetWidgetState();
}

class _ButtomSheetWidgetState extends State<ButtomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) =>  Container(
        height: 80,

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){

                BlocProvider.of<HomeCubit>(context).updateIndex = 0;

              },
              child: Container(
                height: 70,
                width: 70,
                decoration:  state.selectedIndex!=0?null: BoxDecoration(
                  color: MyColors.selectedSheet,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      state.selectedIndex==0?MediaRes.s_nav0:MediaRes.nav0,

                      semanticsLabel: 'Red dash paths',
                    ),
                    MyText(text: 'سوابق' ,color: state.selectedIndex==0?MyColors.primaryColor:Colors.grey,)
                  ],
                )
                
              )


            ),
            InkWell(
              onTap: (){

                BlocProvider.of<HomeCubit>(context).updateIndex = 1;

              },


              child:
              Container(
                  height: 70,
                  width: 70,
                  decoration:  state.selectedIndex!=1?null: BoxDecoration(
                      color: MyColors.selectedSheet,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        state.selectedIndex==1?MediaRes.s_nav1:MediaRes.nav1,

                        semanticsLabel: 'Red dash paths',
                      ),
                      MyText(text: 'بارهای من' ,color: state.selectedIndex==1?MyColors.primaryColor:Colors.grey,)
                    ],
                  )

              )





            ),
            InkWell(
              onTap: (){

                BlocProvider.of<HomeCubit>(context).updateIndex = 2;

              },
              child:  Container(
                  height: 70,
                  width: 70,
                  decoration:  state.selectedIndex!=2?null: BoxDecoration(
                      color: MyColors.selectedSheet,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        state.selectedIndex==2?MediaRes.s_nav2:MediaRes.nav2,

                        semanticsLabel: 'Red dash paths',
                      ),
                      MyText(text: 'خانه' ,color: state.selectedIndex==2?MyColors.primaryColor:Colors.grey,)
                    ],
                  )

              )



                  ),
            InkWell(
              onTap: (){

                BlocProvider.of<HomeCubit>(context).updateIndex = 3;

              },
              child:  Container(
                  height: 70,
                  width: 70,
                  decoration:  state.selectedIndex!=3?null: BoxDecoration(
                      color: MyColors.selectedSheet,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        state.selectedIndex==3?MediaRes.s_nav3:MediaRes.nav3,

                        semanticsLabel: 'Red dash paths',
                      ),
                      MyText(text: 'بارنامه' ,color: state.selectedIndex==3?MyColors.primaryColor:Colors.grey,)
                    ],
                  )

              )

                ),
            InkWell(
              onTap: (){

                BlocProvider.of<HomeCubit>(context).updateIndex = 4;

              },
              child:  Container(
                  height: 70,
                  width: 70,
                  decoration:  state.selectedIndex!=4?null: BoxDecoration(
                      color: MyColors.selectedSheet,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        state.selectedIndex==4?MediaRes.s_nav4:MediaRes.nav4,

                        semanticsLabel: 'Red dash paths',
                      ),
                      MyText(text: 'پشتیبانی' ,color: state.selectedIndex==4?MyColors.primaryColor:Colors.grey,)
                    ],
                  )

              )

                 ),
          ],
        ),
      ),
    );
  }
}
