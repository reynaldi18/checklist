import 'package:flutter/material.dart';

import 'src/app/app.locator.dart';
import 'src/my_app.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}
