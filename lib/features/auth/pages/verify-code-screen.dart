
import 'dart:async';

import 'package:fare/core/components/loading/loading_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toastification/toastification.dart';


import '../../../../core/components/dialog/dialog_manager.dart';
import '../../../../core/components/input/input.dart';
import '../../../../core/components/text/text.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/values.dart';
import '../../../../injection_container.dart';


import '../../../core/components/button/button_widget.dart';
import '../../language/utils/strings.dart';
import '../bloc/auth_bloc.dart';
import '../cubit/timer_cubit.dart';
import '../cubit/update_duration_cubit.dart';
import '../widget/timer_widget.dart';
import 'congrat_screen.dart';


class VerifyCodeScreen extends StatefulWidget {
  static const routeName = '/verify-code-screen';
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {

  double get marginWidth => MediaQuery.of(context).size.width * 0.1;

  double get inputWidth => MediaQuery.of(context).size.width * 0.8;
  final TextEditingController _codeTextEditingController =
  TextEditingController();

  double get sols => MediaQuery.of(context).size.width * 0.3;



  @override
  Widget build(BuildContext context) {
     return
       Scaffold(
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
                  child:  Image.asset(MediaRes.house),

                ),
                Expanded(flex: 2,child: SingleChildScrollView(


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: marginWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40,),
                            MyText(text: 'کد ارسال شده به شماره تلفن ${BlocProvider.of<AuthBloc>(context).state.mobile} را وارد کنید ',textAlign: TextAlign.center,fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black,),

                            SizedBox(height: 20,),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                child: PinCodeTextField(
                                  appContext: context,
                                  length: 5,

                                  obscureText: false,
                                  keyboardType: TextInputType.number,

                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,

                                    activeFillColor: MyColors.cardColor,
                                    inactiveFillColor: MyColors.hintTextColor,
                                    selectedFillColor: MyColors.hintTextColor,
                                    inactiveColor: MyColors.hintTextColor,
                                    selectedColor: MyColors.hintTextColor,
                                    activeColor: MyColors.primaryColor,


                                  ),
                                  enableActiveFill: true,
                                  animationDuration: Duration(milliseconds: 300),
                                  // backgroundColor: Colors.blue.shade50,
                                  //  enableActiveFill: true,
                                  //  errorAnimationController: errorController,
                                  controller: _codeTextEditingController,
                                  onCompleted: (v) {
                                    print("Completed");
                                  },
                                  onChanged: (value) {
                                    print(value);
                                    BlocProvider.of<AuthBloc>(context).add(ChangeCodeOtpEvent(value));
                                  },
                                  beforeTextPaste: (text) {
                                    print("Allowing to paste $text");
                                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                    return true;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 60,),
                      _timerResent,

                      SizedBox(height: 80,),

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
      listenWhen: (previous, current) => previous.statusVerify != current.statusVerify,


      listener: (context,state){

        if(state.statusVerify == StatusButton.success)
        {

          //context.pushReplacement(HomeScreen.routeName);
         // context.go(HomeScreen.routeName);
          context.go(CongrateScreen.routeName);

        }

        else if(state.statusVerify== StatusButton.noInternet)
        {
          sl<DialogManager>().showNoNetDialog(
            context: context,
            onTryAgainClick: () {

              BlocProvider.of<AuthBloc>(context).add(OtpEvent());
            },
          );
        }

        else if(state.statusVerify == StatusButton.failed)
        {
          toastification.show(
              type: ToastificationType.error,
              style: ToastificationStyle.minimal,
              backgroundColor: Colors.grey[100],
              //overlayState: globalNavigatorKey.currentState?.overlay,
              autoCloseDuration: const Duration(seconds: 3),
              title: MyText(text:Strings.of(context).businesses_label,color: Colors.black87,fontWeight: FontWeight.bold,),
              description: MyText(text:state.messageLogin,color: Colors.black87,)
          );

        }


      },
      buildWhen: (previous, current) =>previous.code != current.code || previous.statusVerify != current.statusVerify,
      builder: (context,state) {
        return ButtonWidget(

          isEnable: state.code.length==5,


          onClick: () {

            BlocProvider.of<AuthBloc>(context).add(OtpEvent());


          },
          loading: state.statusVerify==StatusButton.loading,
          text: 'تایید',
          //text: Strings.of(context).confirm_label,
          width: 300,
          height: 45,
        );
      }
  );


  Widget get _timerResent => BlocConsumer<AuthBloc,AuthState>(
      listenWhen: (previous, current) => previous.statusTimer != current.statusTimer,


      listener: (context,state){



         if(state.statusTimer == StatusTimer.failed)
        {
          toastification.show(
              type: ToastificationType.error,
              style: ToastificationStyle.minimal,
              backgroundColor: Colors.grey[100],
              //overlayState: globalNavigatorKey.currentState?.overlay,
              autoCloseDuration: const Duration(seconds: 3),
              title: MyText(text:Strings.of(context).businesses_label,color: Colors.black87,fontWeight: FontWeight.bold,),
              description: MyText(text:state.messageLogin,color: Colors.black87,)
          );
        }
         else if(state.statusTimer== StatusTimer.noInternet)
         {
           sl<DialogManager>().showNoNetDialog(
             context: context,
             onTryAgainClick: () {

               BlocProvider.of<AuthBloc>(context).add(ResendEvent());
             },
           );
         }


      },
      buildWhen: (previous, current) =>previous.statusTimer != current.statusTimer ,
      builder: (context,state) {
        return state.statusTimer== StatusTimer.timer ?


        TimerWidgetClass(duration: Duration(seconds: 120),)

        :  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            MyText(text: 'کد را دریافت نکرده ام',fontWeight: FontWeight.w500,fontSize: 14,),
            SizedBox(width: 10,),
            state.statusTimer== StatusTimer.loading?
                LoadingWidget(width: 25,progressColor:MyColors.primaryColor):
            InkWell(
                onTap: (){
                  BlocProvider.of<AuthBloc>(context).add(ResendEvent());
                //  context.push(SignInScreen.routeName);
                },
                child: MyText(textDecoration: TextDecoration.underline,text: 'ارسال دوباره',fontWeight: FontWeight.w900,color: MyColors.primaryColor,fontSize: 16,)),


            // InkWell(
            //     onTap: (){
            //       context.push(SignInScreen.routeName);
            //     },
            //     child: MyText(textDecoration: TextDecoration.underline,text: Strings.of(context).resend_label,fontWeight: FontWeight.w900,color: MyColors.primaryColor,fontSize: 16,)),
            //
          ],
        );


        // SizedBox(
        //   width: 80,
        //   height: 55,
        //   child: BorderButtonWidget(
        //
        //
        //
        //
        //     onClick: () {
        //
        //       BlocProvider.of<AuthBloc>(context).add(ResendEvent());
        //
        //
        //     },
        //     loading: state.statusTimer==StatusTimer.loading,
        //     text: Strings.of(context).resend_label,
        //
        //
        //   ),
        // );
      }
  );


}


class TimerWidgetClass extends StatefulWidget {
  final Duration duration;

  const TimerWidgetClass({
    Key? key,
    required this.duration,
  }) : super(key: key);

  @override
  State<TimerWidgetClass> createState() => _TimerWidgetClassState();
}

class _TimerWidgetClassState extends State<TimerWidgetClass> {
  Timer? _timer;
  late Duration _currentDuration;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.duration;
    _duration = widget.duration;

    BlocProvider.of<UpdateDurationCubit>(context).setDuration(widget.duration);
    BlocProvider.of<TimerCubit>(context).updateTimer = widget.duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentDuration = Duration(seconds: _currentDuration.inSeconds - 1);
      BlocProvider.of<TimerCubit>(context).updateTimer =
          Duration(seconds: _currentDuration.inSeconds);
      if (_currentDuration.inSeconds == 0) {
        _onRestFinish();
      }
    });
  }

  @override
  void dispose() {
    _disposeTimer();
    super.dispose();
  }

  void _disposeTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _onRestFinish() {

    BlocProvider.of<AuthBloc>(context).add(ChangeStatusTimerEvent(StatusTimer.button));
    _disposeTimer();
  }

  double get _squreHeight => MediaQuery.of(context).size.width * 0.5;

  double get _squreWidth => MediaQuery.of(context).size.width * 0.5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) => TimerWidget(
        isLarge: false,
        minute: state.minute,
        second: state.second,
      ),
    );
  }
}


