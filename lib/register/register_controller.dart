import 'package:flutter/material.dart';
import './register_view.dart';

class RegisterController {
  RegisterController._();

  static const String prefix = '/register';
  static const String setName = prefix + '/setName';
  static const String setJoinDateAndJob = prefix + '/setJoinDateAndJob';
  static const String setProfileImage = prefix + '/setProfileImage';
  static const String setHobbyAndFavourite = prefix + '/setHobbyAndFavourite';

  static final routes = <String, WidgetBuilder>{
    setName: (BuildContext context) => SetName(),
    setJoinDateAndJob: (BuildContext context) => SetJoinDateAndJob(),
    setProfileImage:  (BuildContext context) => SetProfileImage(),
    setHobbyAndFavourite: (BuildContext context) => SetHobbyAndFavourite(),
  };
}

