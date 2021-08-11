import 'package:flutter/material.dart';

import 'src/app/app.locator.dart';
import 'src/injector/injector.dart';
import 'src/my_app.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupInjector();
    setupLocator();
    runApp(MyApp());
  } catch (error, stacktrace) {
    print('$error & $stacktrace');
  }
}
