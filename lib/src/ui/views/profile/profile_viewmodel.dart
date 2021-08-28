import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool nameValidate = false;
  bool emailValidate = false;
  bool phoneValidate = false;

  String? genderValue;
  String? date;

  User? user;

  @override
  Future futureToRun() => getUserData();

  Future<User?> getUserData() async {
    var userData = await _userService.getUser();
    print('USER: ${userData.name}');
    nameController.text = userData.name ?? '';
    user = userData;
    return userData;
  }

  void signOut() {
    // _authService.signOut();
    _navigationService.replaceWith(Routes.loginView);
  }
}
