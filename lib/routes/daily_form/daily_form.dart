import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'widgets/meal_panel.dart';

class DailyForm extends StatefulWidget {
  static const route = '/daily_form';

  const DailyForm({Key? key}) : super(key: key);

  @override
  _DailyFormState createState() => _DailyFormState();
}

class _DailyFormState extends State<DailyForm> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DailyFormModel(),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            MealPanel(mealType: MealType.Breakfast),
            MealPanel(mealType: MealType.Lunch),
            MealPanel(mealType: MealType.Dinner),
            ElevatedButton(
              child: Text("Validate"),
              onPressed: null,
            ),
          ],
        ),
      )),
    );
  }
}
