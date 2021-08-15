import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:si_jaja/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailValidate = false;
  bool passwordValidate = false;

  Future<CoreRes<User>?> login() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    emailValidate = false;
    passwordValidate = false;
    if (emailController.text.isEmpty)
      emailValidate = true;
    else if (passwordController.text.isEmpty)
      passwordValidate = true;
    else {
      if (hasConnection) {
        setBusy(true);
        final result = await _userService.login(
          emailController.text,
          passwordController.text,
        );
        if (result?.status == 'OK') dashboard();
        setBusy(false);
        return result;
      } else
        ConnectionHelper.showNotConnectionSnackBar();
    }
    notifyListeners();
  }

  void dashboard() async => _navigationService.replaceWith(Routes.mainView);
}
