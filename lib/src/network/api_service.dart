import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:si_jaja/src/helpers/http/http_helper.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/network/responses/auth_res.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://private-740f65-sijaja.apiary-mock.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    String? token = HttpHelper().getToken();
    dio.options = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 5000,
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': token,
      },
    );

    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("/oauth/token")
  Future<AuthRes> auth(@Body() Map<String, dynamic> body);

  @GET("/user")
  Future<CoreRes<User>> getUser();

  @GET("/roads")
  Future<CoreRes<List<Plan>>> roads(@Query("status") String status);

  @GET("/histories")
  Future<CoreRes<List<Plan>>> histories(@Query("name")  String name);

  @GET("/roads/{id}")
  Future<CoreRes<Plan>> getRoadDetail(@Path("id") int id);
}