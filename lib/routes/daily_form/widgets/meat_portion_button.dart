import 'package:co2tracker/model/daily_activities.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeatPortionButton extends StatelessWidget {
  final MealType mealType;
  final MeatPortion meatPortion;

  const MeatPortionButton({Key? key, required this.mealType, required this.meatPortion}) : super(key: key);

  String getPortionText(MeatPortion meatPortion) {
    switch (meatPortion) {
      case MeatPortion.small:
        return "Small";
      case MeatPortion.normal:
        return "Normal";
      case MeatPortion.big:
        return "Big";
      case MeatPortion.empty:
        throw Exception("Bug: Empty cannot be displayed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyFormModel>(builder: (BuildContext context, DailyFormModel model, Widget? child) {
      bool isSelected = model.getMealState(mealType).meatPortion == meatPortion;
      return ElevatedButton(
          style: isSelected ? null : ElevatedButton.styleFrom(primary: Colors.green),
          onPressed: () => {model.setPortion(mealType, meatPortion)},
          child: Text(getPortionText(meatPortion)));
    });
  }
}
