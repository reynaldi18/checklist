import 'package:get_it/get_it.dart';
import 'package:si_jaja/src/helpers/storage/shared_preferences_manager.dart';

GetIt locator = GetIt.instance;

Future setupInjector() async {
  SharedPreferencesManager? sharedPreferencesManager =
      await SharedPreferencesManager.getInstance();
  locator
      .registerSingleton<SharedPreferencesManager>(sharedPreferencesManager!);
}
