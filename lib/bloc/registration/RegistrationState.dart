
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegistrationState extends Equatable{
  final String fullname;
  final String email;
  final String mobile;
  final String password;
  final String confirmPassword;
  final String error;
  RegistrationState({
      @required this.fullname,
      @required this.email,
      @required this.mobile,
      @required this.password,
      @required this.confirmPassword,
      @required this.error,}
      ):super([fullname,email,mobile,password,confirmPassword,error]);
  factory RegistrationState.initial(){
    return RegistrationState(fullname: '',email: '',mobile: '',password: '',confirmPassword: '',error: null);
  }
  RegistrationState copyWith({
    @required fullname,
    @required email,
    @required mobile,
    @required password,
    @required confirmPassword,
    @required error,}){
    return RegistrationState(fullname: fullname,email: email,mobile: mobile,password: password,confirmPassword: confirmPassword,error: error);
  }
  @override
  String toString() {
    return super.toString();
  }



}