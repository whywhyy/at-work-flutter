
import 'package:app/login/login_controller.dart';
import 'package:app/onBoarding/onBoarding_controller.dart';
import 'package:app/onBoarding/onBoarding_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(CarouselDemo());

final themeMode = ValueNotifier(2);

// routers
final mapList = [OnBoardingController.routes, LoginController.routes];
final Map<String, WidgetBuilder> routers =  mapList.reduce( (map1, map2) => map1..addAll(map2) );

class CarouselDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/onBoarding/start',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: routers,
        );
      },
      valueListenable: themeMode,
    );
  }
}
