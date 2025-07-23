
import 'package:fare/core/components/text/text.dart';
import 'package:fare/core/utils/enum.dart';
import 'package:fare/core/utils/values.dart';
import 'package:fare/features/salon/bloc/salon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/text/auto_scroll_text.dart';
import '../../../core/components/toolbar/tab-toolbar.dart';
import '../../../core/res/media_res.dart';
import '../../../core/utils/assets.dart';

class SalonToolbar extends StatelessWidget {

  final String title;

  const SalonToolbar({
    required this.title,
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return TabToolbar(
      margin: const EdgeInsets.only(bottom: 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: InkWell(
                  borderRadius: BorderRadius.circular(_actionButtonSize / 2),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Icon(
                            Icons.chevron_left_outlined,
                            //color: Colors.blue,
                            color: Colors.black,
                            size: 32,
                    ),
                  ),
                                ),
                ),
              _titleWidget,
            ],
          ),
          _tabBar
        ],
      )


    );
  }


  Widget get _titleWidget => Builder(
    builder: (context) => Container(
      margin: EdgeInsets.only(
        left: 0,
        right: 0,
      ),
      height: _actionButtonSize,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 12),
      child:
      AutoScrollText(
        key:  ValueKey(title),
        startDuration: const Duration(milliseconds: 1500),
        endDuration: const Duration(milliseconds: 1500),
        duration: const Duration(seconds: 2),
        textAlign: TextAlign.center,
        maxLine: 2,
        text: title,
        color: Colors.black,
        fontSize: 17,
        fontWeight: Fonts.medium,
      ),
    ),
  );



 Widget get _tabBar => BlocBuilder<SalonBloc,SalonState>(
     buildWhen:  (previous, current) =>previous.typeSalon != current.typeSalon,

     builder: (context,state)=>  Expanded(
       child: Row(
         children: [
           Expanded(child: InkWell(
             onTap: (){
  if(state.typeSalon==TypeSalon.private) {
    BlocProvider.of<SalonBloc>(context).add(ChangeTypeSalon(TypeSalon.public));
  }

             },
             child: Column(children: [
               Expanded(child: SizedBox()),
               MyText(text: 'اعلام بار عمومی',fontWeight: FontWeight.bold,fontSize: 15,color: state.typeSalon== TypeSalon.public?

               Theme.of(context).primaryColor : Theme.of(context).hintColor,),
               SizedBox(height: 12,),

               Container(
                 color: Colors.blue,
                 height: state.typeSalon== TypeSalon.public?3:0,
                 width: double.infinity,
               )
             ],),
           )),
           Expanded(child: InkWell(
             onTap: (){
               if(state.typeSalon!=TypeSalon.private) {
                 BlocProvider.of<SalonBloc>(context).add(
                     ChangeTypeSalon(TypeSalon.private));
               }
             },
             child: Column(children: [
               Expanded(child: SizedBox()),

               MyText(text: 'اعلام بار خصوصی',fontWeight: FontWeight.bold,fontSize: 15,color: state.typeSalon!= TypeSalon.public?

               Theme.of(context).primaryColor : Theme.of(context).hintColor),
               SizedBox(height: 12,),

               Container(
                 color: Colors.blue,
                 height: state.typeSalon!= TypeSalon.public?3:0,
                 width: double.infinity,
               )
             ],),
           ))
         ],
       ),
     ));


}



double get _actionButtonSize => 56;
