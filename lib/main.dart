import 'package:co2tracker/routes/daily_form/daily_form.dart';
import 'package:co2tracker/routes/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Co2 Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (BuildContext context) => SplashScreen(),
        Home.route: (BuildContext context) => Home(),
        DailyForm.route: (BuildContext context) =>
            DailyForm(ModalRoute.of(context)!.settings.arguments as DailyFormArgs),
      },
    );
  }
}
