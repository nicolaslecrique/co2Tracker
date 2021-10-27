import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealChoiceButton extends StatelessWidget {
  final MealType mealType;
  final FoodChoice foodChoice;

  List<String> getFoodList(FoodChoice foodChoice) {
    switch (foodChoice) {
      case FoodChoice.Vegetarian:
        return ['Vegetarian'];
      case FoodChoice.PigPoultryFish:
        return ['Pig', 'Poultry', 'Fish'];
      case FoodChoice.BeefLambMutton:
        return ['Beef', 'Lamb', 'Mutton'];
    }
  }

  const MealChoiceButton({Key? key, required this.mealType, required this.foodChoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = Column(
      children: List<Text>.unmodifiable(getFoodList(foodChoice).map((e) => Text(e))),
    );

    return Consumer<DailyFormModel>(builder: (BuildContext context, DailyFormModel model, Widget? child) {
      bool isSelected = model.getMealState(mealType).foodChoice == foodChoice;
      return ElevatedButton(
        onPressed: () {
          model.setFoodChoice(mealType, foodChoice);
        },
        child: buttonChild,
        style: isSelected ? null : ElevatedButton.styleFrom(primary: Colors.green),
      );
    });
  }
}
