import 'daily_activities.dart';

// https://ourworldindata.org/food-choice-vs-eating-local

class Co2EmissionByDay {
  final Day day;
  final double kgCo2;

  Co2EmissionByDay(this.day, this.kgCo2);
}

class Co2Computation {
  static List<Co2EmissionByDay> computeEmissionsByDay(List<ActivitiesWithDate> activities) {
    return List<Co2EmissionByDay>.unmodifiable(
        activities.map((e) => Co2EmissionByDay(e.day, computeFoodEmission(e.activities))));
  }

  static double computeFoodEmission(DailyActivities dailyActivities) {
    return computeMealEmissions(dailyActivities.breakfast) +
        computeMealEmissions(dailyActivities.lunch) +
        computeMealEmissions(dailyActivities.dinner);
  }

  static double computeMealEmissions(Meal meal) {
    return getEmissionsByKg(meal.foodChoice) * getWeightInKg(meal.meatPortion) +
        getNonMeatWeight(meal.meatPortion) * getEmissionsByKg(FoodChoice.Vegetarian);
  }

  static double getEmissionsByKg(FoodChoice foodChoice) {
    switch (foodChoice) {
      case FoodChoice.Vegetarian:
        return 2; // average estimation
      case FoodChoice.PigPoultryFish:
        return 7; // we take pig because it's the most common
      case FoodChoice.BeefLambMutton:
        return 60; // we take beef because it's the most common
    }
  }

  static double getNonMeatWeight(MeatPortion meatPortion) {
    return 0.200; // should probably depends on meat portion
  }

  static double getWeightInKg(MeatPortion meatPortion) {
    switch (meatPortion) {
      case MeatPortion.empty:
        return 0;
      case MeatPortion.small:
        return 0.60;
      case MeatPortion.normal:
        return 0.120;
      case MeatPortion.big:
        return 0.240;
    }
  }
}
