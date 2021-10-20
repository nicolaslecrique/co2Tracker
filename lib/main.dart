import 'package:co2tracker/routes/daily_emissions_form/daily_emissions_form.dart';
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
      initialRoute: Home.route,
      routes: {Home.route: (BuildContext context) => Home(), DailyEmissionForm.route: (BuildContext context) => Home()},
    );
  }
}
