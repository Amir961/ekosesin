import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fare/core/utils/enum.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/values.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  

  final NetworkInfo networkInfo;

  AuthBloc(this.networkInfo,) : super(AuthState(statusTimer: StatusTimer.timer,statusVerify: StatusButton.none,phoneNumberLogin: prefixPhoneNumber, statusLogin: StatusButton.none, messageLogin: '',  code: '', apiKey: '', mobile: '', nationalID: '', phoneNumberSignUp: '', statusSignUp: StatusButton.none)) {

    on<ChangeStatusTimerEvent>(_onChangeStatusTimerEvent);
    on<ChangeCodeOtpEvent>(_onChangeCodeOtpEvent);
    on<ChangePhoneNumberEvent>(_onChangePhoneNumber);
    on<ChangePhoneNumberSignUpEvent>(_onChangePhoneNumberSignUpEvent);
    on<ChangeNationalIDSignUpEvent>(_onChangeNationalIDSignUpEvent);
    on<LoginEvent>(_onLoginEvent);
    on<SignUpEvent>(_onSignUpEvent);
    on<OtpEvent>(_onOtpEvent);
    on<ResendEvent>(_onResendEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  _onResendEvent(
      ResendEvent event,
      Emitter<AuthState> emit,
      ) async {


    emit(state.copyWith(
        statusTimer: StatusTimer.loading ));

    if (!(await networkInfo.isConnected)) {
      return emit(state.copyWith(
          statusTimer: StatusTimer.noInternet ));
    }

      await Future.delayed(Duration(seconds: 2));
    // final result = await  resendUseCase.call(state.successLoginModel!.data!.verifyToken??'');
    // result.fold((l) {
    //   debugPrint('message_error_GetListGetCountry_is:${l.errorMessage}');
    //
    //   emit(state.copyWith(statusTimer: StatusTimer.failed,messageLogin: l.message));
    //
    //   // emit(DecodeTransactionHasError(message: l.message));
    // }, ((r) {
    //
    //
    //   emit(state.copyWith(statusTimer: StatusTimer.timer));
    // }));

    emit(state.copyWith(statusTimer: StatusTimer.timer));









  }

  _onOtpEvent(
      OtpEvent event,
      Emitter<AuthState> emit,
      ) async {


    emit(state.copyWith(
        statusVerify: StatusButton.loading ));

    if (!(await networkInfo.isConnected)) {
      return emit(state.copyWith(
          statusVerify: StatusButton.noInternet ));
    }


      await Future.delayed(Duration(seconds: 2));
    // final result = await  otpUseCase.call([state.code,state.successLoginModel!.data!.verifyToken??'']);
    // result.fold((l) {
    //   debugPrint('message_error_GetListGetCountry_is:${l.errorMessage}');
    //
    //   emit(state.copyWith(statusVerify: StatusButton.failed,messageLogin: l.message));
    //
    //   // emit(DecodeTransactionHasError(message: l.message));
    // }, ((r) {
    //
    //   setMobile(setMobileValue.Params(mobile: state.mobile));
    //   setIsLogin(setLogin.Params(isLogin: r.data!.verifyToken??''));
    //
    //
    //   emit(state.copyWith(statusVerify: StatusButton.success,apiKey: r.data!.verifyToken));
    // }));

    emit(state.copyWith(statusVerify: StatusButton.success,apiKey: 'r.data!.verifyToken'));










  }


  _onLoginEvent(
      LoginEvent event,
      Emitter<AuthState> emit,
      ) async {



    emit(state.copyWith(
        statusLogin: StatusButton.loading ));

    if (!(await networkInfo.isConnected)) {
      return emit(state.copyWith(
          statusLogin: StatusButton.noInternet ));
    }

  await Future.delayed(Duration(seconds: 2));
  // final result = await  loginUseCase.call(state.phoneNumberLogin);
  //   result.fold((l) {
  //     debugPrint('message_error__onLoginEvent_is:${l.errorMessage}');
  //
  //     emit(state.copyWith(statusLogin: StatusButton.failed,messageLogin: l.message));
  //
  //     // emit(DecodeTransactionHasError(message: l.message));
  //   }, ((r) {
  //
  //
  //     emit(state.copyWith(mobile: state.phoneNumberLogin,statusLogin: StatusButton.success,successLoginModel: r));
  //   }));

    emit(state.copyWith(mobile: state.phoneNumberLogin,statusLogin: StatusButton.success,));

 







  }


  _onSignUpEvent(
      SignUpEvent event,
      Emitter<AuthState> emit,
      ) async {



    emit(state.copyWith(
        statusSignUp: StatusButton.loading ));

    if (!(await networkInfo.isConnected)) {
      return emit(state.copyWith(
          statusSignUp: StatusButton.noInternet ));
    }

  await Future.delayed(Duration(seconds: 2));
  // final result = await  signUpUseCase.call(SignUpParams(mobile: state.phoneNumberSignUp, nationalID: state.nationalID));
  //   result.fold((l) {
  //     debugPrint('message_error_SignUpEvent_is:${l.errorMessage}');
  //
  //     emit(state.copyWith(statusSignUp: StatusButton.failed,messageLogin: l.message));
  //
  //     // emit(DecodeTransactionHasError(message: l.message));
  //   }, ((r) {
  //
  //
  //     emit(state.copyWith(mobile: state.phoneNumberSignUp,statusSignUp: StatusButton.success,successLoginModel: r));
  //   }));

    emit(state.copyWith(mobile: state.phoneNumberSignUp,statusSignUp: StatusButton.success,));










  }


  _onChangePhoneNumber(
      ChangePhoneNumberEvent event,
      Emitter<AuthState> emit,
      ) async {



    debugPrint('ChangePhoneNumber_is: ${event.phoneNumber}');



    emit(state.copyWith(
        phoneNumberLogin: event.phoneNumber ));



  }

  _onChangePhoneNumberSignUpEvent(
      ChangePhoneNumberSignUpEvent event,
      Emitter<AuthState> emit,
      ) async {



    debugPrint('ChangePhoneNumberSignUpEvent_is: ${event.phoneNumber}');



    emit(state.copyWith(
        phoneNumberSignUp: event.phoneNumber ));



  }

  _onChangeNationalIDSignUpEvent(
      ChangeNationalIDSignUpEvent event,
      Emitter<AuthState> emit,
      ) async {



    debugPrint('ChangeNationalIDSignUpEvent_is: ${event.nationalID}');



    emit(state.copyWith(
        nationalID: event.nationalID ));



  }


  _onLogOutEvent(
      LogOutEvent event,
      Emitter<AuthState> emit,
      ) async {







    emit(state.copyWith(
        phoneNumberLogin: '',mobile: '',apiKey: '',nationalID:'',phoneNumberSignUp: '' ));

       // setMobile(setMobileValue.Params(mobile: ''));
       // setIsLogin(setLogin.Params(isLogin: ''));

  }

  _onChangeStatusTimerEvent(
      ChangeStatusTimerEvent event,
      Emitter<AuthState> emit,
      ) async {






    emit(state.copyWith(
        statusTimer: event.statusTimer ));



  }

  _onChangeCodeOtpEvent(
      ChangeCodeOtpEvent event,
      Emitter<AuthState> emit,
      ) async {



    debugPrint('code_is: ${event.code}');



    emit(state.copyWith(
        code: event.code ));



  }
}
