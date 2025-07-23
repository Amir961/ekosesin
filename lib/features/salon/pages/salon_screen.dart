

import 'package:fare/core/components/loading/loading_widget.dart';
import 'package:fare/core/components/text/text.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:fare/core/utils/enum.dart';
import 'package:fare/core/utils/values.dart';
import 'package:fare/features/salon/models/salon_model.dart';
import 'package:fare/features/salon/pages/details_salon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/button/button_widget.dart';
import '../../../core/components/dialog/dialog_manager.dart';
import '../../../injection_container.dart';
import '../../theme/presentation/widget/setting_toolbar.dart';
import '../bloc/salon_bloc.dart';
import '../widget/salon_toolbar.dart';

class SalonScreen extends StatefulWidget {
  static const routeName = '/salon-screen';
  const SalonScreen({super.key});

  @override
  State<SalonScreen> createState() => _SalonScreenState();
}

class _SalonScreenState extends State<SalonScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async
  {
    if(BlocProvider.of<SalonBloc>(context).state.listCity.isEmpty) {
      BlocProvider.of<SalonBloc>(context).add(
        GetListCity());
    }

    if(BlocProvider.of<SalonBloc>(context).state.listSalonModel.isEmpty) {
      BlocProvider.of<SalonBloc>(context).add(
          GetListSalon());
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _bottomSheet,
      body: SafeArea(child: SizedBox.expand(
        child: Column(
          children: [
            SalonToolbar(title: 'سالن اعلام بار',),
            _filter,
             Expanded(child: Padding(
               padding: const EdgeInsets.only(bottom: 80.0),
               child: _listView,
               
               
             ))

           // SettingToolBarWidget(title: 'hhhjj',)
          ],
        ),
      ))
    );



  }


  Widget get _listView => BlocBuilder<SalonBloc,SalonState>(
      buildWhen:  (previous, current) =>previous.listSalonModel.isNotEmpty != current.listSalonModel.isNotEmpty || previous.statusButton != current.statusButton,
      builder: (context,state) {
        return state.statusButton == StatusButton.loading?
             Center(child: LoadingWidget(progressColor:MyColors.accentColor),):
            
          state.listSalonModel.isEmpty?  Center(child: MyText(text: 'باری وجود نداره'),):
          ListView.builder(
              itemCount: state.listSalonModel.length,
              itemBuilder: (context,index){
          return 
            
            myContainer(state.listSalonModel[index]);
        });
          
      }
  );
  
  Widget get _filter => BlocBuilder<SalonBloc,SalonState>(
   // buildWhen:  (previous, current) =>previous.typeFilterSalon != current.typeFilterSalon,
    builder: (context,state) {
      return Container(
        margin: EdgeInsets.only(top: 10),

        padding: EdgeInsets.symmetric(horizontal: 15),

        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
  if(state.typeFilterSalon!=TypeFilterSalon.myNav)
  {
    BlocProvider.of<SalonBloc>(context).add(
        ChangeTopFilter(TypeFilterSalon.myNav));
  }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: state.typeFilterSalon== TypeFilterSalon.myNav?

                          Theme.of(context).primaryColor : Theme.of(context).hintColor,

                        width: 1.5,
                      ),
                    ),
                    child: MyText(text: 'ویژه ناوگان من',fontSize: 15,color: state.typeFilterSalon== TypeFilterSalon.myNav?

                    Theme.of(context).primaryColor : Theme.of(context).hintColor,),

                  ),
                ),
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){
  if(state.typeFilterSalon==TypeFilterSalon.myNav) {
    BlocProvider.of<SalonBloc>(context).add(
        ChangeTopFilter(TypeFilterSalon.all));
  }

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color:
                        state.typeFilterSalon== TypeFilterSalon.all?

                        Theme.of(context).primaryColor : Theme.of(context).hintColor,

                        width: 1.5,
                      ),
                    ),
                    child: MyText(text: 'همه',fontSize: 15,color: state.typeFilterSalon== TypeFilterSalon.all?

                    Theme.of(context).primaryColor : Theme.of(context).hintColor,),

                  ),
                ),
              ],
            ),
            InkWell(
              onTap: (){
                sl<DialogManager>().showFilterSalonDialog(
                  myContext: context, source: state.selectedSource, destination: state.selectedDestination

                );

              },
              child: Icon(Icons.filter_alt,color: Colors.grey[700],size: 32,),
            )


          ],
        ),
      );
    }
  );

  Widget get _bottomSheet => Container(

    color: Colors.white,

    padding: EdgeInsets.symmetric(horizontal: 15),
    height: 80,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(text: 'تعداد بارهای رزرو شده من',fontWeight: FontWeight.w500,fontSize: 14,),
        ButtonWidget(
          backGroundColor:MyColors.accentColor,
          fontSize: 18,

          isEnable: true,


          onClick: () {




          },
          loading: false,
          text: 'بارهای من',
          width: 150,
          height: 40,
        ),

      ],
    ),
  );

  Widget myContainer(SalonModel salonModel)
  {
    return Container(

    //  height: 140,
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 14,vertical: 0),

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(MediaRes.back_salon,),fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:
          //  ?
          //Theme.of(context).primaryColor
            Theme.of(context).hintColor,

          width: 1,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(MediaRes.source),
              SizedBox(width: 5,),
              Row(
                children: [
                  Image.asset(MediaRes.dash),
                  Image.asset(MediaRes.peykan),
                ],
              ),
              SizedBox(width: 5,),
              Image.asset(MediaRes.des),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
             Column(
               children: [
                 MyText(text: salonModel.firstOrigin?.title??'',color: Colors.black,fontWeight: FontWeight.bold,),
                 MyText(text: salonModel.firstOrigin?.city?.title??'',color: Colors.grey[600],fontWeight: FontWeight.w500,)

               ],
             ),
              Column(
                children: [
                  MyText(text: salonModel.destination?.title??'',color: Colors.black,fontWeight: FontWeight.bold,),
                  MyText(text: salonModel.destination?.city?.title??'',color: Colors.grey[600],fontWeight: FontWeight.w600,)

                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [

                //  MyText(text: 'اصفهان',color: Colors.grey[600],fontWeight: FontWeight.w500,),
                  Image.asset(MediaRes.truck),
                  SizedBox(width: 8,),
                  MyText(text: '${salonModel.loader?.vehicleCategory?.title}-${salonModel.loader?.loaderCategory?.title}',color: Colors.black,fontWeight: FontWeight.w300,),


                ],
              ),
              SizedBox(width: 50,),
              Expanded(
                child: Row(
                  children: [ 
                
                    Image.asset(MediaRes.goods),
                    SizedBox(width: 8,),
                    Expanded(child: MyText(text: '${salonModel.goodsCategory?.title}-${salonModel.goodsPackage?.title}',color: Colors.black,fontWeight: FontWeight.w300,)),
                
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container (
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyColors.primaryColor.withAlpha(70),
              borderRadius: BorderRadius.circular(10)
             ),
            child: Center(child: MyText(text: ' 25,000,000 تومان کرایه:')),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [

                  //  MyText(text: 'اصفهان',color: Colors.grey[600],fontWeight: FontWeight.w500,),

                  MyText(text: 'تاریخ بارگیری ۱۴۰۴/۰۴/۲۹',color: Colors.black,fontWeight: FontWeight.w300,),


                ],
              ),
              InkWell(
                onTap: (){
                  context.push(DetailsSalonScreen.routeName,extra: salonModel.id);
                },
                child: Row(
                  children: [



                    MyText(text: 'جزییات',color: MyColors.primaryColor,fontWeight: FontWeight.bold,fontSize: 17,),
                    SizedBox(width: 2,),
                    Icon(Icons.chevron_right,color: MyColors.primaryColor,size: 30,),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),

        ],
      ),

    );
  }
}



