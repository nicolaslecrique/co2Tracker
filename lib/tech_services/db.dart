import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co2tracker/model/app_user.dart';
import 'package:co2tracker/model/daily_activities.dart';

import 'db_data.dart';

class Db {
  static Future<AppUser> getOrCreateUser(String userUid) async {
    DocumentReference<DbUser> docRef = DbUser.docRef(FirebaseFirestore.instance, userUid);

    DocumentSnapshot<DbUser> userDs = await docRef.get();
    if (userDs.exists) {
      return AppUser(userDs.data()!.userUid);
    } else {
      var dbUser = DbUser(userUid);
      await docRef.set(dbUser);
      return AppUser(dbUser.userUid);
    }
  }

  static Future<void> setDailyActivities(AppUser user, Day day, DailyActivities dailyActivities) async {
    DbDailyActivities dbDailyActivities = DbDailyActivities.fromModel(dailyActivities);

    var docRef = DbDailyActivities.docRef(FirebaseFirestore.instance, user.userUid, day);
    await docRef.set(dbDailyActivities);
  }

  static Future<List<ActivitiesWithDate>> getActivities(AppUser user) async {
    final c = await DbDailyActivities.colRef(FirebaseFirestore.instance, user.userUid).get();
    return List<ActivitiesWithDate>.unmodifiable(
        c.docs.map((e) => ActivitiesWithDate(Day.fromKey(e.id), e.data().toModel())));
  }
}
