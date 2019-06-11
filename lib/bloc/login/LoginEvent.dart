import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvents extends Equatable {
  LoginEvents([List props=const []]):super(props);
}

class LoginSubmit extends LoginEvents {
  final String email;
  final String password;
  LoginSubmit(@required this.email, @required this.password):super([email,password]);
}
