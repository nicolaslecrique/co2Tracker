import 'package:flutter/foundation.dart';

enum FoodChoice {
  Vegetarian,
  PigPoultryFish,
  BeefLambMutton,
}

enum MeatPortion { empty, small, normal, big }

@immutable
class Meal {
  final FoodChoice foodChoice;
  final MeatPortion meatPortion; // no if foodChoice is Vegetarian

  const Meal(this.foodChoice, this.meatPortion);
}

@immutable
class DailyActivities {
  final Meal breakfast;
  final Meal lunch;
  final Meal dinner;

  const DailyActivities(this.breakfast, this.lunch, this.dinner);
}
