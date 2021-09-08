import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/helpers/storage/shared_preferences_manager.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FutureViewModel<User?> {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool nameValidate = false;
  bool emailValidate = false;
  bool phoneValidate = false;

  String? genderValue;
  String? date;

  User? user;

  @override
  Future<User?> futureToRun() => getUserData();

  Future<User?> getUserData() async {
    var userData = await _userService.fetchUser();
    nameController.text = userData?.name ?? '';
    emailController.text = userData?.email ?? '';
    print('USER: ${userData?.name}');
    notifyListeners();
    user = userData;
    return userData;
  }

  void signOut() {
    _sharedPreferencesManager.clearAll();
    _navigationService.replaceWith(Routes.loginView);
  }
}
