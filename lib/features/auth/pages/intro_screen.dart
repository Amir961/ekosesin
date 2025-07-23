
  
import 'package:fare/core/components/button/border_button_widget.dart';
import 'package:fare/core/res/media_res.dart';
import 'package:fare/core/utils/values.dart';
import 'package:fare/features/auth/pages/login_screen.dart';
import 'package:fare/features/auth/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/button/button_widget.dart';
import '../../language/utils/strings.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/intro-screen';
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double get marginWidth => MediaQuery.of(context).size.width * 0.1;

  double get inputWidth => MediaQuery.of(context).size.width * 0.8;
  double get sols => MediaQuery.of(context).size.width * 0.3;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: Container(
        height: double.infinity,
        width: double.infinity,
        color: MyColors.primaryColor,
        child: Stack(
          fit: StackFit.expand,
          children: [

           Column(
             children: [
               Expanded(flex: 1,child: SizedBox(

               )),
               Expanded(flex: 2,child: Container(

                 decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(56),
                 topRight: Radius.circular(56),
               ),
                 ),
               )),

             ],
           ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: sols+23),

                alignment:Alignment.bottomCenter,
                  child:  Image.asset(MediaRes.logo),

                ),
                Expanded(flex: 2,child: Container(


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ButtonWidget(

                        isEnable: true,


                        onClick: () {

                         
                          context.push(LoginScreen.routeName);
                        },
                       
                        text: "ورود",
                        width: inputWidth,

                        height: 45, loading: false,
                      ),
                      SizedBox(height: 10,),
                      BorderButtonWidget(loading: false,
                          width: inputWidth,

                          height: 45,
                          onClick: (){

                            context.push(SignInScreen.routeName);


                      }, text: "ثبت نام")
                    ],
                  ),
                )),

              ],
            ),


          ],
        ),
      )),
    );
  }
}
