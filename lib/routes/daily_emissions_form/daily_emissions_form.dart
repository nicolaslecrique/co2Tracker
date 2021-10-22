import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/meal.dart';

class DailyEmissionForm extends StatefulWidget {
  static const route = '/daily_emissions_form';

  const DailyEmissionForm({Key? key}) : super(key: key);

  @override
  _DailyEmissionFormState createState() => _DailyEmissionFormState();
}

class _DailyEmissionFormState extends State<DailyEmissionForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Meal(mealTitle: 'Breakfast'),
        Meal(mealTitle: 'Lunch'),
        Meal(mealTitle: 'Dinner'),
        ElevatedButton(
          child: Text("FORM"),
          onPressed: null,
        ),
      ],
    ));
  }
}
