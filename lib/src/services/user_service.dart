import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/constant/config.dart';
import 'package:si_jaja/src/constant/session.dart';
import 'package:si_jaja/src/helpers/storage/shared_preferences_manager.dart';
import 'package:si_jaja/src/models/auth.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/network/api_service.dart';
import 'package:si_jaja/src/network/requests/login_req.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class UserService {
  final logger = Logger();
  ApiService apiService = ApiService(Dio());
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  Future<Auth?> login(
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> req = LoginReq(
        username: email,
        password: password,
        grantType: Config.grantType,
        clientId: Config.clientId,
        clientSecret: Config.clientSecret,
      ).toJson();
      final data = await apiService.auth(req);
      if (data.accessToken != null) {
        _sharedPreferencesManager.putString(
          Session.token,
          data.accessToken ?? '',
        );
        fetchUser();
      }
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<User?> fetchUser() async {
    try {
      final data = await apiService.getUser();
      if (data.success == true) saveUserInfo(data.data!);
      return data.data;
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveUserInfo(User data) async {
    final User user = data;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Session.user, jsonEncode(user));
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString(Session.user)!;
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    final User user = User.fromJson(userMap);
    return user;
  }
}
