import 'package:co2tracker/model/daily_activities.dart';
import 'package:flutter/foundation.dart';

enum MealType { Breakfast, Lunch, Dinner }

class DailyFormModel extends ChangeNotifier {
  final Day day;

  DailyActivities state;

  DailyFormModel(this.day, DailyActivities initialState) : state = initialState;

  Meal getMealState(MealType mealType) {
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
    MeatPortion defaultPortion = foodChoice == FoodChoice.Vegetarian ? MeatPortion.empty : MeatPortion.normal;
    state = new DailyActivities(
        mealType == MealType.Breakfast ? new Meal(foodChoice, defaultPortion) : state.breakfast,
        mealType == MealType.Lunch ? new Meal(foodChoice, defaultPortion) : state.lunch,
        mealType == MealType.Dinner ? new Meal(foodChoice, defaultPortion) : state.dinner);
    notifyListeners();
  }

  void setPortion(MealType mealType, MeatPortion meatPortion) {
    state = new DailyActivities(
        mealType == MealType.Breakfast ? new Meal(state.breakfast.foodChoice, meatPortion) : state.breakfast,
        mealType == MealType.Lunch ? new Meal(state.lunch.foodChoice, meatPortion) : state.lunch,
        mealType == MealType.Dinner ? new Meal(state.dinner.foodChoice, meatPortion) : state.dinner);
    notifyListeners();
  }

  void confirmDailyForm() {}
}
