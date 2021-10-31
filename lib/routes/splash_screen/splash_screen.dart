import 'package:co2tracker/routes/home/home.dart';
import 'package:co2tracker/tech_services/authentication.dart';
import 'package:flutter/material.dart';

@immutable
class SplashScreen extends StatefulWidget {
  static const route = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initUser().then((value) => null);
  }

  Future<void> initUser() async {
    await Authentication.authenticate(context);
    await Navigator.pushNamedAndRemoveUntil(context, Home.route, (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //nb: logo is done with https://cooltext.com/
      body: Text("loading"),
    );
  }
}
