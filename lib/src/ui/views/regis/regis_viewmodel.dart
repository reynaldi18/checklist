import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:si_jaja/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailValidate = false;
  bool usernameValidate = false;
  bool passwordValidate = false;

  Future<CoreRes?> regis() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    emailValidate = false;
    usernameValidate = false;
    passwordValidate = false;
    if (emailController.text.isEmpty)
      emailValidate = true;
    else if (usernameController.text.isEmpty)
      usernameValidate = true;
    else if (passwordController.text.isEmpty)
      passwordValidate = true;
    else {
      if (hasConnection) {
        setBusy(true);
        final result = await _userService.regis(
          emailController.text,
          usernameController.text,
          passwordController.text,
        );
        print('RESULT: $result');
        if (result!.statusCode! >= 2000 ) login();
        setBusy(false);
        return result;
      } else
        ConnectionHelper.showNotConnectionSnackBar();
    }
    notifyListeners();
  }

  void login() async => _navigationService.replaceWith(Routes.loginView);
}
