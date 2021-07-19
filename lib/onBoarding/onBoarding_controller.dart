import 'package:app/login/login_controller.dart';
import 'package:flutter/material.dart';
import './onBoarding_view.dart';

class OnBoardingController {
  OnBoardingController._();

  static const String prefix = '/onBoarding';
  static const String start = prefix + '/start';

  static final routes = <String, WidgetBuilder>{
    start: (BuildContext context) => OnBoardingView(),
  };
}

