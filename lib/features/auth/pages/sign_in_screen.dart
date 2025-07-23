



import 'package:fare/features/auth/pages/verify-code-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';


import '../../../../core/components/dialog/dialog_manager.dart';
import '../../../../core/components/input/input.dart';
import '../../../../core/components/text/text.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/utils/assets.dart' show Fonts;
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/input_formatter.dart';
import '../../../../core/utils/values.dart';
import '../../../../injection_container.dart';

import '../../../core/components/button/button_widget.dart';
import '../../language/utils/strings.dart';
import '../bloc/auth_bloc.dart';
import 'login_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in-screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _phoneTextEditingController =
  TextEditingController(text: prefixPhoneNumber);

  final TextEditingController _codeTextEditingController =
  TextEditingController();
  double get sols => MediaQuery.of(context).size.width * 0.3;

  final FocusNode _focusNode= FocusNode();

  double get marginWidth => MediaQuery.of(context).size.width * 0.1;

  double get inputWidth => MediaQuery.of(context).size.width * 0.8;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _codeTextEditingController.dispose();
    _focusNode.dispose();
  }

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
                Expanded(flex: 1,child:   Column(

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
                Expanded(flex: 2,child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: marginWidth),
                  child: SingleChildScrollView(


                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50,),
                        MyText(text: 'لطفا شماره تلفن همرا و شماره ملی خود را وارد کنید',fontWeight: FontWeight.bold,),
                        SizedBox(height: 20,),

                        Input(
                          width: inputWidth,
                          controller: _phoneTextEditingController,
                          nextFocusNode: _focusNode,

                          // focusNode: _timer180FocusNode,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                            PhoneNumberFormatter(prefixPhoneNumber),

                          ],
                          maxLines: 1,
                          onChange: (value) {
                            BlocProvider.of<AuthBloc>(context).add(ChangePhoneNumberSignUpEvent(value));

                          },




                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                         // hintText: Strings.of(context).enter_your_phone_number,
                          textColor: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: Fonts.medium,
                          borderColor: MyColors.hintTextColor,
                          hintFontSize: 11,

                          // perfix:
                          // //Container(height: 60,width: 60,color: Colors.blue,)
                          // Icon(
                          //   Icons.phone_iphone_rounded,
                          //   size: 28,
                          //   color: MyColors.primaryColor,
                          // ),

                        ),

                        SizedBox(height: 10,),

                        Input(
                          width: inputWidth,
                          controller: _codeTextEditingController,

                          focusNode: _focusNode,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                            NationalFormatter(),

                          ],
                          maxLines: 1,
                          onChange: (value) {
                            BlocProvider.of<AuthBloc>(context).add(ChangeNationalIDSignUpEvent(value));

                          },


                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          hintText: 'شماره ملی',
                          textColor: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: Fonts.medium,
                          borderColor: MyColors.hintTextColor,
                          hintFontSize: 11,

                          // perfix:
                          // //Container(height: 60,width: 60,color: Colors.blue,)
                          // Icon(
                          //   Icons.co_present_outlined,
                          //   size: 28,
                          //   color: MyColors.primaryColor,
                          // ),

                        ),
                        SizedBox(height: 50,),


                        Center(child: _button),
                        SizedBox(height: 7,),

                      ],
                    ),
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
      listenWhen: (previous, current) => previous.statusSignUp != current.statusSignUp,


      listener: (context,state){

        if(state.statusSignUp == StatusButton.success)
        {

          context.push(VerifyCodeScreen.routeName);

        }
        else if(state.statusSignUp== StatusButton.noInternet)
        {
          sl<DialogManager>().showNoNetDialog(
            context: context,
            onTryAgainClick: () {

              BlocProvider.of<AuthBloc>(context).add(SignUpEvent());
            },
          );
        }

        else if(state.statusSignUp == StatusButton.failed)
        {
          debugPrint('error_is: statusSignUp');
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
      buildWhen: (previous, current) =>previous.nationalID != current.nationalID || previous.phoneNumberSignUp != current.phoneNumberSignUp || previous.statusSignUp != current.statusSignUp,
      builder: (context,state) {
        return ButtonWidget(

          isEnable: state.phoneNumberSignUp.length==11 && state.nationalID.length==10,


          onClick: () {

            BlocProvider.of<AuthBloc>(context).add(SignUpEvent());


          },
          loading: state.statusSignUp==StatusButton.loading,
          text: 'تایید و دریافت کد',
          width: 300,
          height: 45,
        );
      }
  );


}


