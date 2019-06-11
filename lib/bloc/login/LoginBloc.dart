import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:air_miles/bloc/login/LoginEvent.dart';
import 'package:air_miles/bloc/login/LoginState.dart';
import 'package:air_miles/Utils.dart';
class LoginBloc extends Bloc<LoginEvents,LoginState> {
  @override
  // TODO: implement initialState
  LoginState get initialState => LoginState.initial();
  String validation(LoginSubmit event){
    if(event.email.isEmpty){
      return "Please enter the email";
    }
    if(!Utils.IsvalidEmail(event.email)){
      return "Please enter the valid email";
    }
    if(event.password.isEmpty){
      return "Please enter the Password";
    }
    if(!Utils.isValidPassword(event.password)){
      return "Please enter the valid Password";
    }
    return null;

  }

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvents event) async*{
    if(event is LoginSubmit){
      yield currentState.copyWith(
        email: event.email,
        error: validation(event),
        password: event.password,
      );
    }
   // return null;
  }
}
