
import 'package:fare/core/components/inherited/tablet_checker/app_provider.dart';
import 'package:fare/core/components/loading/loading_widget.dart';
import 'package:fare/features/home/bloc/category_bloc.dart';
import 'package:fare/features/home/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../features/language/utils/strings.dart';

import '../../../injection_container.dart';
import '../../utils/assets.dart';
import '../../utils/enum.dart';
import '../../utils/input_formatter.dart';
import '../../utils/values.dart';
import '../button/button_widget.dart';
import '../dialog/dialog_manager.dart';
import '../icon/svg_string.dart';
import '../input/input.dart';
import '../text/text.dart';

class SelectCategorySheetWidget extends StatefulWidget {
  final BuildContext context;
  const SelectCategorySheetWidget({required this.context,super.key});

  @override
  State<SelectCategorySheetWidget> createState() => _SelectCategorySheetWidgetState();
}

class _SelectCategorySheetWidgetState extends State<SelectCategorySheetWidget> {

  @override
  Widget build(BuildContext context) {
    return

      WillPopScope(
        onWillPop: () async {
          // بازگشت false یعنی دکمه Back نادیده گرفته شود
          return false;
        },
        child: BlocProvider.value(
        value: BlocProvider.of<CategoryBloc>(widget.context),
        child: _view

            ),
      );
  }

  Widget get _view =>
      BlocConsumer<CategoryBloc,CategoryState>(
      listenWhen: (previous, current) => previous.statusButton != current.statusButton,


      listener: (context,state){

        if(state.statusButton == StatusButton.success)
        {

         // context.push(VerifyCodeScreen.routeName);

        }

        else if(state.statusButton== StatusButton.noInternet)
        {
          sl<DialogManager>().showNoNetDialog(
            context: context,
            onTryAgainClick: () {

             // BlocProvider.of<SalonBloc>(context).add(SendBarToOther(value: _phoneTextEditingController.text));
            },
          );
        }

        else if(state.statusButton == StatusButton.failed)
        {
          debugPrint('error_is: statusLogin');
          toastification.show(
              type: ToastificationType.error,
              style: ToastificationStyle.minimal,
              backgroundColor: Colors.grey[100],
              //overlayState: globalNavigatorKey.currentState?.overlay,
              autoCloseDuration: const Duration(seconds: 3),
              title: MyText(text:'Strings.of(context).failed_label',color: Colors.black87,fontWeight: FontWeight.bold,),
              description: MyText(text:state.message,color: Colors.black87,)
          );

        }


      },
      buildWhen: (previous, current) =>previous.statusButton != current.statusButton || previous.queenList.length != current.queenList.length,
      builder: (context,state) {
        return state.statusButton== StatusButton.loading?
            LoadingWidget():
        state.statusButton== StatusButton.failed?
            MyText(text: 'error'):

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    state.queenList.isEmpty?
                    MyText(
                      text: Strings.of(context).category_label,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,

                    ):
                    InkWell(
                      onTap: (){
                        BlocProvider.of<CategoryBloc>(context).add(PopEvent());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.chevron_left_outlined,color: AppProvider.of(context).isDark?Colors.white:Colors.black,size: 30,),
                          MyText(
                            text: Strings.of(context).category_label,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,

                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child:  Icon(
                        Icons.clear,
                        size: 24,
                        color: AppProvider.of(context).isDark?Colors.white:Colors.black,
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 10),

              Visibility(
                visible: state.queenList.isNotEmpty,
                child: InkWell(
                  onTap: (){
                    BlocProvider.of<CategoryBloc>(context).add(SetAllEvent());
                    Navigator.of(context).pop();
                  },
                  child: Row(

                    children: [
                      SizedBox(width: 15,),
                      Icon(Icons.arrow_back,color: AppProvider.of(context).isDark?Colors.white:Colors.black),
                      MyText(
                        text: Strings.of(context).all_poster_label,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,

                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 8, bottom: 8,right: 12,left: 12),

                itemCount:state.queenList.length ,
                itemBuilder: (context, index) =>
                    myContainerTop(state.queenList[index],index,state.queenList.length-1==index),

              ),

              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 8, bottom: 8,right: 12,left: 12),

                itemCount:state.queenList.isEmpty?  state.listCategory.length: state.queenList.last.children?.length ,
                itemBuilder: (context, index) =>
                    myContainer(state.queenList.isEmpty?  state.listCategory[index]: state.queenList.last.children![index]),

              ),






              const SizedBox(height: 40),


            ],
          );
      }
  );

  Widget myContainer(CategoryModel categoryModel){
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            BlocProvider.of<CategoryBloc>(widget.context).add(
                PushEvent(categoryModel));

            if(categoryModel.children!.isEmpty) {
             Navigator.of(context).pop();
            }
          },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 20,
                    child: SvgString( svgString: categoryModel.iconSvg??'',height: 18,width: 18,)),
                SizedBox(width: 5,),
                MyText(text: categoryModel.translateTitle()??'')
              ],
            ),

            categoryModel.children!.isEmpty? SizedBox():
                Icon(Icons.chevron_right_outlined)

          ],
        ),
      ),
    );
  }


  Widget myContainerTop(CategoryModel categoryModel,int index,bool isPop){
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if(isPop) {
              Navigator.of(context).pop();
              return;
            }
            BlocProvider.of<CategoryBloc>(widget.context).add(
                PopUntilEvent(index));


          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: index*10,),
                  SizedBox(
                      width: 20,
                      child: SvgString( svgString: categoryModel.iconSvg??'',height: 18,width: 18,)),
                  SizedBox(width: 5,),
                  MyText(text: categoryModel.translateTitle()??'')
                ],
              ),

             SizedBox()

            ],
          ),
        ),
      );
  }
}
