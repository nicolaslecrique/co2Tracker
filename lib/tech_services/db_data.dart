import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co2tracker/model/daily_activities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// command to run generation watch: flutter pub run build_runner watch
// or to not watch but ust build one shot:  flutter pub run build_runner build
// https://flutter.dev/docs/development/data-and-backend/json#serializing-json-using-code-generation-libraries
part 'db_data.g.dart';

@JsonSerializable()
@immutable
class DbUser {
  static const String COLLECTION_NAME = "users";

  final String userUid;

  const DbUser(this.userUid);

  static DocumentReference<DbUser> docRef(FirebaseFirestore fs, String userUid) {
    return fs
        .collection(COLLECTION_NAME)
        .withConverter(
            fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) =>
                _$DbUserFromJson(snapshot.data()!),
            toFirestore: (DbUser value, SetOptions? options) => _$DbUserToJson(value))
        .doc(userUid);
  }
}

enum DbFoodChoice {
  Vegetarian,
  PigPoultryFish,
  BeefLambMutton,
}

enum DbMeatPortion { empty, small, normal, big }

@JsonSerializable()
@immutable
class DbMeal {
  final DbFoodChoice foodChoice;
  final DbMeatPortion meatPortion; // null if foodChoice is Vegetarian

  const DbMeal(this.foodChoice, this.meatPortion);

  static DbFoodChoice _foodChoiceFromModel(FoodChoice foodChoice) {
    switch (foodChoice) {
      case FoodChoice.Vegetarian:
        return DbFoodChoice.Vegetarian;
      case FoodChoice.PigPoultryFish:
        return DbFoodChoice.PigPoultryFish;
      case FoodChoice.BeefLambMutton:
        return DbFoodChoice.BeefLambMutton;
    }
  }

  static DbMeatPortion _meatPortionFromModel(MeatPortion meatPortion) {
    switch (meatPortion) {
      case MeatPortion.empty:
        return DbMeatPortion.empty;
      case MeatPortion.small:
        return DbMeatPortion.small;
      case MeatPortion.normal:
        return DbMeatPortion.normal;
      case MeatPortion.big:
        return DbMeatPortion.big;
    }
  }

  static DbMeal fromModel(Meal meal) {
    return DbMeal(_foodChoiceFromModel(meal.foodChoice), _meatPortionFromModel(meal.meatPortion));
  }

  static DbMeal fromJson(Map<String, dynamic> json) => _$DbMealFromJson(json);

  toJson() {
    return _$DbMealToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
class DbDailyActivities {
  static const String COLLECTION_NAME = "days";

  final DbMeal breakfast;
  final DbMeal lunch;
  final DbMeal dinner;

  const DbDailyActivities(this.breakfast, this.lunch, this.dinner);

  static DbDailyActivities fromModel(DailyActivities dailyActivities) {
    return DbDailyActivities(DbMeal.fromModel(dailyActivities.breakfast), DbMeal.fromModel(dailyActivities.lunch),
        DbMeal.fromModel(dailyActivities.dinner));
  }

  static DocumentReference<DbDailyActivities> docRef(FirebaseFirestore fs, String userUid, Day day) {
    return DbUser.docRef(fs, userUid)
        .collection(COLLECTION_NAME)
        .withConverter(
            fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) =>
                _$DbDailyActivitiesFromJson(snapshot.data()!),
            toFirestore: (DbDailyActivities value, SetOptions? options) => _$DbDailyActivitiesToJson(value))
        .doc(day.toKeyString());
  }
}
