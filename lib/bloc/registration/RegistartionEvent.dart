import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegistartionEvent extends Equatable{
  RegistartionEvent([List props=const[]]):super(props);
}

class RegistrationSubmit extends RegistartionEvent{
  final String fullname;
  final String mobile;
  final String email;
  final String password;
  final String confirmPassword;

  RegistrationSubmit(
      @required this.fullname,
      @required this.email,
      @required this.mobile,
      @required this.password,
      @required this.confirmPassword,

      ):super([fullname,email,mobile,password,confirmPassword]);

}