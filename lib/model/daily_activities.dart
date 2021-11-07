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

  static final DailyActivities defaultDay = DailyActivities(Meal(FoodChoice.Vegetarian, MeatPortion.empty),
      Meal(FoodChoice.Vegetarian, MeatPortion.empty), Meal(FoodChoice.Vegetarian, MeatPortion.empty));
}

@immutable
class Day {
  final int year;
  final int month;
  final int day;

  const Day(this.year, this.month, this.day);

  static current() {
    // up to 4a.m, the day we input is the previous day
    DateTime now = DateTime.now().subtract(Duration(hours: 4));
    return Day(now.year, now.month, now.day);
  }

  String toKeyString() {
    return "$year-$month-$day";
  }
}
