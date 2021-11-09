import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co2tracker/model/daily_activities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class DbUser {
  static const String COLLECTION_NAME = "users";

  final String userUid;

  const DbUser(this.userUid);

  static DbUser fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    return new DbUser(snapshot.get("userUid"));
  }

  static Map<String, Object?> toFirestore(
    DbUser value,
    SetOptions? options,
  ) {
    return {"userUid": value.userUid};
  }

  static DocumentReference<DbUser> docRef(FirebaseFirestore fs, String userUid) {
    return fs
        .collection(COLLECTION_NAME)
        .withConverter(fromFirestore: DbUser.fromFirestore, toFirestore: DbUser.toFirestore)
        .doc(userUid);
  }
}

enum DbFoodChoice {
  Vegetarian,
  PigPoultryFish,
  BeefLambMutton,
}

enum DbMeatPortion { empty, small, normal, big }

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
}

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

  static DocumentReference docRef(FirebaseFirestore fs, String userUid, DbDailyActivities) {
    return fs.collection(COLLECTION_NAME).doc(userUid);
  }
}

class Db {
  static Future<DbUser> getOrCreateUser(String userUid) async {
    DocumentReference<DbUser> docRef = DbUser.docRef(FirebaseFirestore.instance, userUid);

    DocumentSnapshot<DbUser> userDs = await docRef.get();
    if (userDs.exists) {
      return userDs.data()!;
    } else {
      var user = DbUser(userUid);
      await docRef.set(user);
      return user;
    }
  }

  static void insertDay(DateTime date, DailyActivities dailyActivities) {
    DbDailyActivities dbDailyActivities = DbDailyActivities.fromModel(dailyActivities);

    String userUid = FirebaseAuth.instance.currentUser!.uid;

    /*
    FirebaseFirestore.instance
        .collection("collectionPath")
        .withConverter(fromFirestore: DbUser.fromFirestore, toFirestore: DbUser.toFirestore)
        .then((QuerySnapshot<DbUser> value) => null);

     */
  }
}
