import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String error;

  LoginState({@required this.email,
      @required this.password,

      @required this.error})
      : super([email
    , password
    , error
    ]);
  factory LoginState.initial() {
    return LoginState(email: '', password: '', error: '');
  }
  LoginState copyWith({
    String email,
    String password,

    String error
  }){
    return LoginState(email: email,password: password,error: error);
  }
  @override
  String toString() {
    return super.toString();
  }
}
