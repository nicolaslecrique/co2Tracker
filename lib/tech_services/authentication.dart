import 'package:co2tracker/tech_services/uxcam.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Authentication {
  static Future<void> authenticate(BuildContext context) async {
    // 1) init firebase
    await Firebase.initializeApp();

    // 2) init crashlytics
    // NB: for now crashlytics seems not to work well with flutter (obfuscated stack trace)
    // https://github.com/FirebaseExtended/flutterfire/issues/1150
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    // 3) authenticate user
    FirebaseAuth auth = FirebaseAuth.instance;
    final UserCredential cred = await auth.signInAnonymously();
    String userId = cred.user!.uid;

    if (!kDebugMode) {
      // 4) init tracking
      initUxCam(userId);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }
  }
}
