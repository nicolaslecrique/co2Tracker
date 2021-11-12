import 'package:co2tracker/model/app_user.dart';
import 'package:co2tracker/model/daily_activities.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:co2tracker/routes/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'widgets/meal_panel.dart';

@immutable
class DailyFormArgs {
  final AppUser appUser;
  final Day day;
  final DailyActivities defaultActivities;

  const DailyFormArgs(this.appUser, this.day, this.defaultActivities);
}

class DailyForm extends StatefulWidget {
  static const route = '/daily_form';
  final AppUser appUser;
  final Day day;
  final DailyActivities defaultActivities;

  DailyForm(DailyFormArgs args, {Key? key})
      : appUser = args.appUser,
        day = args.day,
        defaultActivities = args.defaultActivities,
        super(key: key);

  @override
  _DailyFormState createState() => _DailyFormState();
}

class _DailyFormState extends State<DailyForm> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DailyFormModel(widget.appUser, widget.day, widget.defaultActivities),
      child: DailyFormWithModel(),
    );
  }
}

class DailyFormWithModel extends StatelessWidget {
  const DailyFormWithModel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          MealPanel(mealType: MealType.Breakfast),
          MealPanel(mealType: MealType.Lunch),
          MealPanel(mealType: MealType.Dinner),
          ElevatedButton(
              child: Text("Validate"),
              onPressed: () {
                Provider.of<DailyFormModel>(context, listen: false).confirmDailyForm();
                Navigator.pushNamedAndRemoveUntil(context, Home.route, (route) => false);
              }),
        ],
      ),
    ));
  }
}
