import 'package:flutter/foundation.dart';

import 'daily_form_state.dart';

class DailyFormModel extends ChangeNotifier {
  DailyFormState state = DailyFormState.defaultDay();
}
