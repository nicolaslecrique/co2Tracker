import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/meal.dart';

class DailyForm extends StatefulWidget {
  static const route = '/daily_form';

  const DailyForm({Key? key}) : super(key: key);

  @override
  _DailyFormState createState() => _DailyFormState();
}

class _DailyFormState extends State<DailyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Meal(mealTitle: 'Breakfast'),
          Meal(mealTitle: 'Lunch'),
          Meal(mealTitle: 'Dinner'),
          ElevatedButton(
            child: Text("Validate"),
            onPressed: null,
          ),
        ],
      ),
    ));
  }
}
