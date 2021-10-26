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
}
