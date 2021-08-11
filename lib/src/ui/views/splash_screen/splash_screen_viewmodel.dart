import 'dart:async';

import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/helpers/http/http_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreenViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();

  var _duration = Duration(seconds: 2);

  @override
  Future futureToRun() => versionCheck();

  Future versionCheck() async {
    String? token = HttpHelper().getToken();

    print(token);

    if (token != null)
      Timer(_duration, navigateToDashboard);
    else
      Timer(_duration, navigateToLogin);
  }

  void navigateToLogin() => _navigationService.replaceWith(Routes.loginView);

  void navigateToDashboard() => _navigationService.replaceWith(Routes.mainView);
}
