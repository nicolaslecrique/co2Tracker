import 'package:co2tracker/model/daily_activities.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:flutter/material.dart';

import 'meat_portion_button.dart';

class MeatPortions extends StatelessWidget {
  final MealType mealType;
  const MeatPortions({Key? key, required this.mealType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MeatPortionButton(mealType: mealType, meatPortion: MeatPortion.small),
        MeatPortionButton(mealType: mealType, meatPortion: MeatPortion.normal),
        MeatPortionButton(mealType: mealType, meatPortion: MeatPortion.big)
      ],
    );
  }
}
