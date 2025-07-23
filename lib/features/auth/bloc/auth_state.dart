part of 'auth_bloc.dart';


 class AuthState  extends Equatable{
   final String phoneNumberLogin;
   final String phoneNumberSignUp;
   final String nationalID;
   final String apiKey;
   final String mobile;
   final String code;
   final String messageLogin;
   final StatusButton statusLogin;

   final StatusButton statusVerify;
   final StatusButton statusSignUp;
   final StatusTimer statusTimer;
   //final SuccessLoginModel? successLoginModel;

  AuthState({required this.phoneNumberSignUp,required this.statusSignUp,required this.nationalID,required this.mobile,required this.apiKey,required this.statusTimer,required this.code,required this.statusVerify,required this.messageLogin,required this.phoneNumberLogin, required this.statusLogin});

   AuthState copyWith({
      String? phoneNumberLogin,
      String? phoneNumberSignUp,
      String? apiKey,
      String? mobile,
      String? nationalID,
      String? messageLogin,
      StatusButton? statusLogin,
    // SuccessLoginModel? successLoginModel,

      StatusButton? statusVerify,
      StatusButton? statusSignUp,
     String? code,
     StatusTimer? statusTimer
 })=> AuthState(
     mobile: mobile ?? this.mobile,
     nationalID: nationalID ?? this.nationalID,
     apiKey: apiKey ?? this.apiKey,
      phoneNumberLogin: phoneNumberLogin ?? this.phoneNumberLogin,
     phoneNumberSignUp: phoneNumberSignUp ?? this.phoneNumberSignUp,
     statusLogin: statusLogin ?? this.statusLogin,
     statusSignUp: statusSignUp ?? this.statusSignUp,

     statusVerify: statusVerify ?? this.statusVerify,
     messageLogin: messageLogin ?? this.messageLogin,
    // successLoginModel: successLoginModel ?? this.successLoginModel,
     code: code ?? this.code,
     statusTimer: statusTimer ?? this.statusTimer,

   );

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumberSignUp,statusSignUp,nationalID,mobile,apiKey,code,statusTimer,statusVerify,messageLogin,phoneNumberLogin,statusLogin];
}


