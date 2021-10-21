import 'package:co2tracker/design/constants.dart';
import 'package:co2tracker/routes/daily_emissions_form/daily_emissions_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  static const route = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(StandardSizes.medium),
          child: Column(
            children: <Widget>[
              Spacer(),
              SizedBox(height: StandardSizes.medium),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Today"),
                  onPressed: () => Navigator.pushNamed(context, DailyEmissionForm.route),
                ),
              )
            ],
          )),
    );
  }
}
