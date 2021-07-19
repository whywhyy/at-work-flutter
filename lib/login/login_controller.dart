import 'package:flutter/material.dart';
import './login_view.dart';

class LoginController {
  LoginController._();

  static const String prefix = '/login';
  static const String selectRegisterOrLogin = prefix + '/registerOrLogin';
  static const String registerOrLogin = prefix + '/register';

  static final routes = <String, WidgetBuilder>{
    selectRegisterOrLogin: (BuildContext context) => SelectRegisterOrLogin(),
    registerOrLogin: (BuildContext context) => RegisterOrLogin(),
  };
}

