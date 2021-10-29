import 'package:flutter/foundation.dart';

import 'daily_form_state.dart';

enum MealType { Breakfast, Lunch, Dinner }

class DailyFormModel extends ChangeNotifier {
  DailyFormState state = DailyFormState.defaultDay();

  MealState getMealState(MealType mealType) {
    switch (mealType) {
      case MealType.Breakfast:
        return state.breakfast;
      case MealType.Lunch:
        return state.lunch;
      case MealType.Dinner:
        return state.dinner;
    }
  }

  void setFoodChoice(MealType mealType, FoodChoice foodChoice) {
    FoodPortion? defaultPortion = foodChoice == FoodChoice.Vegetarian ? null : FoodPortion.normal;
    state = new DailyFormState(
        mealType == MealType.Breakfast ? new MealState(foodChoice, defaultPortion) : state.breakfast,
        mealType == MealType.Lunch ? new MealState(foodChoice, defaultPortion) : state.lunch,
        mealType == MealType.Dinner ? new MealState(foodChoice, defaultPortion) : state.dinner);
    notifyListeners();
  }

  void setPortion(MealType mealType, FoodPortion foodPortion) {
    state = new DailyFormState(
        mealType == MealType.Breakfast ? new MealState(state.lunch.foodChoice, foodPortion) : state.lunch,
        mealType == MealType.Lunch ? new MealState(state.lunch.foodChoice, foodPortion) : state.lunch,
        mealType == MealType.Dinner ? new MealState(state.dinner.foodChoice, foodPortion) : state.dinner);
    notifyListeners();
  }
}
