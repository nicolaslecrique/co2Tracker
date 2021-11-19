import 'package:co2tracker/design/constants.dart';
import 'package:co2tracker/model/daily_activities.dart';
import 'package:co2tracker/model/user_model.dart';
import 'package:co2tracker/routes/daily_form/daily_form.dart';
import 'package:co2tracker/routes/home/widgets/co2_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const route = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<UserModel>(context, listen: false);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(StandardSizes.medium),
          child: Column(
            children: <Widget>[
              SizedBox(height: StandardSizes.medium),
              Co2Chart(),
              SizedBox(height: StandardSizes.medium),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Today"),
                  onPressed: () => Navigator.pushNamed(context, DailyForm.route,
                      arguments: DailyFormArgs(model.user, Day.current(), DailyActivities.defaultDay)),
                ),
              )
            ],
          )),
    );
  }
}
