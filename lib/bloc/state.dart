import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState({this.error, this.isLoading = false});

  final String? error;
  final bool isLoading;

  @override
  List<Object?> get props => [error, isLoading];
}
class StateIsLoading extends LoginState {
  const StateIsLoading () : super (isLoading:true);
}
class PhoneInputState extends LoginState {
  const PhoneInputState({String? error}) : super(error: error);
}

class SmsRequestedState extends LoginState {
  const SmsRequestedState(this.phone, {String? error}) : super(error: error);

  final String phone;
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState() : super();
}
