import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/constant/session.dart';
import 'package:si_jaja/src/helpers/storage/shared_preferences_manager.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/network/api_service.dart';
import 'package:si_jaja/src/network/requests/login_req.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class UserService {
  final logger = Logger();
  ApiService apiService = ApiService(Dio());
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  Future<CoreRes<User>?> login(
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> req = LoginReq(
        email,
        password,
      ).toJson();
      final data = await apiService.auth(req);
      if (data.status == 'OK') {
        _sharedPreferencesManager.putString(
          Session.token,
          data.data?.token ?? '',
        );
        fetchUser();
      }
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes<User>?> fetchUser() async {
    try {
      final data = await apiService.getUser();
      if (data.status == 'OK') saveUserInfo(data.data!);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveUserInfo(User data) async {
    final User user = data;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Session.user, jsonEncode(user));
  }

  Future<User> getUser(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString(Session.user)!;
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    final User user = User.fromJson(userMap);
    return user;
  }
}
