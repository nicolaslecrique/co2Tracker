import 'package:cloud_firestore/cloud_firestore.dart';
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

  static DocumentReference docRef(String userUid) {
    return FirebaseFirestore.instance.collection(COLLECTION_NAME).doc(userUid);
  }
}

enum DbFoodChoice {
  Vegetarian,
  PigPoultryFish,
  BeefLambMutton,
}

enum DbMeatPortion { no, small, normal, big }

@immutable
class DbMeal {
  final DbFoodChoice foodChoice;
  final DbMeatPortion meatPortion; // null if foodChoice is Vegetarian

  const DbMeal(this.foodChoice, this.meatPortion);
}

@immutable
class DbDailyActivities {
  final DbMeal breakfast;
  final DbMeal lunch;
  final DbMeal dinner;

  const DbDailyActivities(this.breakfast, this.lunch, this.dinner);
}

class Db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void insertDay() {
    firestore
        .collection("collectionPath")
        .withConverter(fromFirestore: DbUser.fromFirestore, toFirestore: DbUser.toFirestore)
        .get()
        .then((QuerySnapshot<DbUser> value) => null);
  }
}
