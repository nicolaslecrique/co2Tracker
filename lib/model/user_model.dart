import 'package:co2tracker/model/app_user.dart';
import 'package:co2tracker/model/co2_computation.dart';
import 'package:co2tracker/model/daily_activities.dart';
import 'package:co2tracker/tech_services/authentication.dart';
import 'package:co2tracker/tech_services/db.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  late AppUser user;
  late List<ActivitiesWithDate> activities;
  late List<Co2EmissionByDay> emissionsByDay;

  Future<void> init() async {
    AppUser user = await Authentication.authenticate();
    this.user = user;

    activities = await Db.getActivities(user);
    emissionsByDay = Co2Computation.computeEmissionsByDay(activities);
  }
}
