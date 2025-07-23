
import 'package:fare/features/auth/pages/verify-code-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../core/components/button/border_button_widget.dart';
import '../../../core/components/button/button_widget.dart';
import '../../../core/components/dialog/dialog_manager.dart';
import '../../../core/components/input/input.dart';
import '../../../core/components/text/text.dart';
import '../../../core/res/media_res.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/enum.dart';
import '../../../core/utils/input_formatter.dart';
import '../../../core/utils/values.dart';
import '../../../injection_container.dart';
import '../../language/utils/strings.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double get marginWidth => MediaQuery.of(context).size.width * 0.1;

  double get inputWidth => MediaQuery.of(context).size.width * 0.8;
  double get sols => MediaQuery.of(context).size.width * 0.3;
  final TextEditingController _phoneTextEditingController =
  TextEditingController(text: prefixPhoneNumber);


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
                Expanded(flex: 1,child:
                Column(

                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                      // height: 100,
                      // color: Colors.white,
                      child: InkWell(
                       onTap: (){
                         context.pop();
                       },
                        child: Row(
                          children: [
                            Icon(Icons.chevron_left_outlined,color: Colors.white,size: 32,),
                            MyText(text: 'بازگشت',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17,),

                          ],
                        ),
                      ),
                    ),
                  ],


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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(text: 'لطفاً شماره تلفن همراه خود را وارد نمایید.',fontWeight: FontWeight.bold,color: Colors.black,),
                          SizedBox(height: 7,),
                          Input(
                            width: inputWidth,
                            controller: _phoneTextEditingController,

                            // focusNode: _timer180FocusNode,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(11),
                              PhoneNumberFormatter(prefixPhoneNumber),

                            ],
                            maxLines: 1,
                            onChange: (value) {

                              BlocProvider.of<AuthBloc>(context).add(ChangePhoneNumberEvent(value));
                            },


                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                           // hintText: Strings.of(context).enter_your_phone_number,
                            textColor: Theme.of(context).textTheme.bodyLarge?.color,
                            fontWeight: Fonts.medium,
                            borderColor: MyColors.hintTextColor,
                            hintFontSize: 11,
                            textAlign: TextAlign.center,

                            // perfix:
                            // //Container(height: 60,width: 60,color: Colors.blue,)
                            // Icon(
                            //   Icons.phone_iphone_rounded,
                            //   size: 23,
                            //   color: MyColors.primaryColor,
                            // ),

                          ),
                        ],
                      ),
                      _button
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

  Widget get _button => BlocConsumer<AuthBloc,AuthState>(
      listenWhen: (previous, current) => previous.statusLogin != current.statusLogin,


      listener: (context,state){

        if(state.statusLogin == StatusButton.success)
        {

          context.push(VerifyCodeScreen.routeName);

        }

        else if(state.statusLogin== StatusButton.noInternet)
        {
          sl<DialogManager>().showNoNetDialog(
            context: context,
            onTryAgainClick: () {

              BlocProvider.of<AuthBloc>(context).add(LoginEvent());
            },
          );
        }

        else if(state.statusLogin == StatusButton.failed)
        {
          debugPrint('error_is: statusLogin');
          toastification.show(
              type: ToastificationType.error,
              style: ToastificationStyle.minimal,
              backgroundColor: Colors.grey[100],
              //overlayState: globalNavigatorKey.currentState?.overlay,
              autoCloseDuration: const Duration(seconds: 3),
              title: MyText(text:Strings.of(context).failed_label,color: Colors.black87,fontWeight: FontWeight.bold,),
              description: MyText(text:state.messageLogin,color: Colors.black87,)
          );

        }


      },
      buildWhen: (previous, current) =>previous.phoneNumberLogin != current.phoneNumberLogin || previous.statusLogin != current.statusLogin,
      builder: (context,state) {
        return

          ButtonWidget(
            fontSize: 18,

            isEnable: state.phoneNumberLogin.length==11,


            onClick: () {

              BlocProvider.of<AuthBloc>(context).add(LoginEvent());


            },
            loading: state.statusLogin==StatusButton.loading,
            text: 'تایید و دریافت کد',
            width: 300,
            height: 45,
          );
      }
  );
}
