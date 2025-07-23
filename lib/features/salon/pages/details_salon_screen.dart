import 'package:fare/core/components/loading/loading_widget.dart';
import 'package:fare/core/utils/enum.dart';
import 'package:fare/core/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/button/border_button_widget.dart';
import '../../../core/components/button/button_widget.dart';
import '../../../core/components/button/feedback_button.dart';
import '../../../core/components/text/text.dart';
import '../../../core/res/media_res.dart';
import '../bloc/salon_bloc.dart';

class DetailsSalonScreen extends StatefulWidget {
  static const routeName = '/details-salon-screen';
  final String id;

  const DetailsSalonScreen({required this.id, super.key});

  @override
  State<DetailsSalonScreen> createState() => _DetailsSalonScreenState();
}

class _DetailsSalonScreenState extends State<DetailsSalonScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    BlocProvider.of<SalonBloc>(context).add(GetDetailsSalon(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomSheet,
      backgroundColor: Colors.grey[100],
      body: SafeArea(

          child: SizedBox.expand(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        MediaRes.headerDetails,
                      ),
                      fit: BoxFit.fill),
                  color: MyColors.primaryColor.withAlpha(100)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 10,right: 10,bottom: 15),
                    // height: 100,
                    // color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.chevron_left_outlined,
                            color: Colors.black,
                            size: 32,
                          ),
                          MyText(
                            text: 'جزییات بار',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ],
                      ),
                    ),
                  ),
                  header
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      InkWell(
                        child: Container(
                          height:40,
                          width: 40,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(child: Image.asset(MediaRes.message),),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height:40,
                          width: 40,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(child: Image.asset(MediaRes.send),),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height:40,
                          width: 40,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(child: Icon(Icons.share,color: Colors.white,),),
                        ),
                      ),
                      

                    ],
                  ),
                  SizedBox(height: 10,),
                  information
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }

  Widget get header => BlocBuilder<SalonBloc, SalonState>(
      buildWhen: (previous, current) =>
          previous.statusDetails != current.statusDetails,
      builder: (context, state) {
        if (state.statusDetails == StatusButton.success) {
          return
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Column(
                children: [
                  MyText(
                    text: state.detailsSalonModels?.company?.title ?? '',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(MediaRes.sourceWhite),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Image.asset(MediaRes.dash),
                          Image.asset(MediaRes.peykan),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(MediaRes.desWhite),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          MyText(
                            text: state.detailsSalonModels?.firstOrigin?.title ?? '',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            text: state.detailsSalonModels?.firstOrigin?.city?.title ?? '',
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          MyText(
                            text: state.detailsSalonModels?.destination?.title ?? '',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            text: state.detailsSalonModels?.destination?.city?.title ?? '',
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
            );
        } else {
          return SizedBox();
        }
      });

  Widget row(String title,String value)
  {
    return
      Container(
      height: 40,

      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(text: title,fontWeight: FontWeight.w600,),
          MyText(text: value,fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }

  Widget get _bottomSheet => Container(

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
    ),


    padding: EdgeInsets.symmetric(horizontal: 15),
    height: 80,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [


           BorderButtonWidget(
             borderColor: Colors.green,
             loading: false, onClick: (){},
             width: 170,
             height: 40, child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [

                Image.asset(MediaRes.phone),
                 SizedBox(width: 5,),
                 MyText(text: 'تماس با کارفرما',color: Colors.green,),
               ],
             ),),

        FeedbackButtonWidget(
          width: 170,
          height: 40,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.check_circle_outline,color: Colors.white),
              SizedBox(width: 5,),
              MyText(text: 'رزروبار',color: Colors.white,),
            ],
          ),
        )

      ],
    ),
  );

  Widget get information => BlocBuilder<SalonBloc, SalonState>(
      buildWhen: (previous, current) =>
      previous.statusDetails != current.statusDetails,
      builder: (context, state) {
  if (state.statusDetails == StatusButton.loading) {
    return Center(child: LoadingWidget(progressColor: MyColors.accentColor,),);
  }
      else  if (state.statusDetails == StatusButton.success) {
          return
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [

                Container(
                height: 40,

                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[300]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(text: 'کرایه',fontWeight: FontWeight.w600,color: Colors.black,),
                    MyText(text: ' هر سرویس 25,000,000 تومان',fontWeight: FontWeight.w500,color: Colors.black,),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orangeAccent,
                        ),),
                        MyText(text: ' قابل مذاکره',fontWeight: FontWeight.w500,),
                      ],
                    ),
                  ],
                ),
              ),
                  row('پاداش',state.detailsSalonModels?.value??''),
                  row('نوع ناوگان',state.detailsSalonModels?.loader?.loaderCategory?.title??''),
                  row('نوع ماشین',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),
                  row('نوع ماشین',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),
                  row('وزن بار:',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),
                  row('کالا و زیر کالا:',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),
                  row('نوع بسته بندی:',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),
                  row('تاریخ بارگیری:',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),
                  row('حداکثر زمان تحویل بار:',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),
                  row('نوع ماشین',state.detailsSalonModels?.loader?.vehicleCategory?.title??''),

                ],
              ),
            );
        } else {
          return SizedBox();
        }
      });
}
