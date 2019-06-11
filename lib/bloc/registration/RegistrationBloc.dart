import 'package:bloc/bloc.dart';
import 'package:air_miles/bloc/registration/RegistrationState.dart';
import 'package:air_miles/bloc/registration/RegistartionEvent.dart';
import 'package:air_miles/Constants.dart';

import '../../Utils.dart';

class RegistrationBloc extends Bloc<RegistartionEvent,RegistrationState>{
  @override
  RegistrationState get initialState => RegistrationState.initial();

  @override
  Stream<RegistrationState> mapEventToState(RegistrationState currentState, RegistartionEvent event) async*{
    if(event is RegistrationSubmit){
      yield currentState.copyWith(fullname: event.fullname, email: event.email, mobile: event.mobile, password: event.password, confirmPassword: event.confirmPassword, error: validation(event));
    }

  }
  String validation(RegistrationSubmit event){
    if(event.fullname.isEmpty){
      return Errors.Empty_FULL_NAME;
    }
    if(event.email.isEmpty){
      return Errors.Empty_email;
    }
    if(!Utils.IsvalidEmail(event.email)){
      return Errors.VALID_EMAIL;
    }
    if(event.mobile.isEmpty){
      return Errors.Empty_Phone;
    }
    if(!Utils.isPhoneNumber(event.mobile)){
      return Errors.VALID_phone;
    }
    if(event.password.isEmpty){
      return Errors.Empty_password;
    }
    if(event.confirmPassword.isEmpty){
      return Errors.Empty_confirm_password;
    }
    if(!(event.password==event.confirmPassword)){
      return Errors.PASSWORD_NOT_Match;
    }
    return null;
  }

}