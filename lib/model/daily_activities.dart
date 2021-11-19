import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

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
  static final DateFormat keyFormatter = DateFormat('yyyy-MM-dd');

  const Day(this.year, this.month, this.day);

  static Day fromKey(String key) {
    var dateTime = keyFormatter.parse(key);
    return Day(dateTime.year, dateTime.month, dateTime.day);
  }

  static current() {
    // up to 4a.m, the day we input is the previous day
    DateTime now = DateTime.now().subtract(Duration(hours: 4));
    return Day(now.year, now.month, now.day);
  }

  String toKeyString() {
    return keyFormatter.format(DateTime(year, month, day));
  }
}

@immutable
class ActivitiesWithDate {
  final Day day;
  final DailyActivities activities;

  const ActivitiesWithDate(this.day, this.activities);
}
