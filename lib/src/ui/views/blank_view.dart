import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/constant/session.dart';
import 'package:si_jaja/src/helpers/storage/shared_preferences_manager.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/widgets/button.dart';
import 'package:stacked_services/stacked_services.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navigationServer = locator<NavigationService>();
    final SharedPreferencesManager _sharedPreferencesManager =
    locator<SharedPreferencesManager>();
    return Center(
      child: CustomButton(
        label: Strings.labelLogout,
        logout: true,
        onPress: () {
          _sharedPreferencesManager.clearKey(Session.token);
          _navigationServer.replaceWith(Routes.loginView);
        },
      )
    );
  }
}
