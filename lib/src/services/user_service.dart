
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/constant/session.dart';
import 'package:si_jaja/src/helpers/storage/shared_preferences_manager.dart';
import 'package:si_jaja/src/models/auth.dart';
import 'package:si_jaja/src/network/api_service.dart';
import 'package:si_jaja/src/network/requests/login_req.dart';
import 'package:si_jaja/src/network/requests/regis_req.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class UserService {
  final logger = Logger();
  ApiService apiService = ApiService(Dio());
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  Future<CoreRes<Auth>?> login(
    String username,
    String password,
  ) async {
    try {
      final Map<String, dynamic> req = LoginReq(
        username: username,
        password: password,
      ).toJson();
      final data = await apiService.auth(req);
      if (data.data != null) {
        _sharedPreferencesManager.putString(
          Session.token,
          data.data?.token ?? '',
        );
      }
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes?> regis(
      String email,
      String username,
      String password,
      ) async {
    try {
      final Map<String, dynamic> req = RegisReq(
        email: email,
        username: username,
        password: password,
      ).toJson();
      final data = await apiService.regis(req);
      return data;
    } catch (e) {
      print(e);
    }
  }
}
