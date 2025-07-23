part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangePhoneNumberEvent extends AuthEvent{
  final String phoneNumber;
  const ChangePhoneNumberEvent(this.phoneNumber);
}

class ChangePhoneNumberSignUpEvent extends AuthEvent{
  final String phoneNumber;
  const ChangePhoneNumberSignUpEvent(this.phoneNumber);
}
class ChangeNationalIDSignUpEvent extends AuthEvent{
  final String nationalID;
  const ChangeNationalIDSignUpEvent(this.nationalID);
}

class ChangeCodeOtpEvent extends AuthEvent{
  final String code;
  const ChangeCodeOtpEvent(this.code);
}

class ChangeStatusTimerEvent extends AuthEvent{
  final StatusTimer statusTimer;
  const ChangeStatusTimerEvent(this.statusTimer);
}

class LoginEvent extends AuthEvent{

}

class SignUpEvent extends AuthEvent{

}

class OtpEvent extends AuthEvent{

}

class ResendEvent extends AuthEvent{

}

class LogOutEvent extends AuthEvent{

}

