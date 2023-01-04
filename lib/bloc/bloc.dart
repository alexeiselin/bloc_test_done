import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/state.dart';
import 'package:test_task/repository/repository.dart';

import 'event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.repository) : super(const PhoneInputState());

  final LoginRepository repository;
   late String _phone;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {


    if (event is PhoneEnteredEvent){
      _phone = event.phone;
      yield const StateIsLoading();
      try {
        await repository.requestSms(_phone);
        yield  SmsRequestedState (_phone);
      } catch (e) {
        yield   PhoneInputState(error: e.toString());

      }
      }
    else if (event is ReenterPhoneEvent) {
      yield const PhoneInputState();
    }
    else if (event is ResendSmsEvent) {
      yield SmsRequestedState(_phone);
    }
    else if (event is CheckEnteredCode) {
      final code = event.code;
      yield const StateIsLoading();
        try {
        await repository.checkCode(_phone, code);
        yield  const LoginSuccessState ();
      } catch (e) {
        yield   SmsRequestedState(_phone, error: e.toString());

      }
    }

    }


  }

