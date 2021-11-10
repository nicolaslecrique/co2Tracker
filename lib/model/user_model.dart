import 'package:co2tracker/model/app_user.dart';
import 'package:co2tracker/tech_services/authentication.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  late AppUser user;

  Future<void> init() async {
    AppUser user = await Authentication.authenticate();
    this.user = user;
  }
}
