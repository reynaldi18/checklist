import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/constant/session.dart';
import 'package:si_jaja/src/helpers/storage/shared_preferences_manager.dart';

class HttpHelper {
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  getToken() => _sharedPreferencesManager.getString(Session.token);

}
