import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:intl/intl.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: mainColor, // this one for android
          statusBarBrightness: Brightness.light // this one for iOS
          ),
    );
    // Setup image picker configs
    var configs = ImagePickerConfigs();
    // AppBar text color
    configs.appBarTextColor = Colors.white;
    configs.appBarBackgroundColor = mainColor;
    // Disable select images from album
    // configs.albumPickerModeEnabled = false;
    // Only use front camera for capturing
    // configs.cameraLensDirection = 0;
    // Translate function
    configs.translateFunc = (name, value) => Intl.message(value, name: name);
    // Disable edit function, then add other edit control instead
    configs.adjustFeatureEnabled = false;
    configs.externalImageEditors['external_image_editor_1'] = EditorParams(
      title: 'external_image_editor_1',
      icon: Icons.edit_rounded,
      onEditorEvent: (
              {required BuildContext context,
              required File file,
              required String title,
              int maxWidth = 1080,
              int maxHeight = 1920,
              int compressQuality = 90,
              ImagePickerConfigs? configs}) async =>
          await Navigator.of(context).push(
        MaterialPageRoute<File>(
          fullscreenDialog: true,
          builder: (context) => ImageEdit(
            file: file,
            title: title,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            configs: configs,
          ),
        ),
      ),
    );
    configs.externalImageEditors['external_image_editor_2'] = EditorParams(
        title: 'external_image_editor_2',
        icon: Icons.edit_attributes,
        onEditorEvent: (
                {required BuildContext context,
                required File file,
                required String title,
                int maxWidth = 1080,
                int maxHeight = 1920,
                int compressQuality = 90,
                ImagePickerConfigs? configs}) async =>
            await Navigator.of(context).push(MaterialPageRoute<File>(
                fullscreenDialog: true,
                builder: (context) => ImageSticker(
                    file: file,
                    title: title,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    configs: configs))));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SI Bang Jaja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
