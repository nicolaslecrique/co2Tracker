import 'package:flutter/material.dart';

enum FoodChoice {
  Vegetarian,
  PigPoultryFish,
  BeefLambMutton,
}

enum FoodPortion { small, normal, big }

@immutable
class Meal {
  final FoodChoice foodChoice;
  final FoodPortion? foodPortionOrNull; // null if foodChoice is Vegetarian

  Meal(this.foodChoice, this.foodPortionOrNull);
}

@immutable
class DailyFormState {
  final Meal breakfast;
  final Meal lunch;
  final Meal dinner;

  const DailyFormState(this.breakfast, this.lunch, this.dinner);

  factory DailyFormState.defaultDay() {
    return DailyFormState(
        Meal(FoodChoice.Vegetarian, null), Meal(FoodChoice.Vegetarian, null), Meal(FoodChoice.Vegetarian, null));
  }
}
