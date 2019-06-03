import 'dart:async';

class LoginBlog  {
  // ignore: close_sinks
  final emailController = StreamController<String>();
  Stream get getEmail => emailController.stream;
  



}
enum LoginEvent { onLoginClick }