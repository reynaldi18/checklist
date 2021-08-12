import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:si_jaja/src/helpers/http/http_helper.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://private-740f65-sijaja.apiary-mock.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    String? token = HttpHelper().getToken();
    dio.options = BaseOptions(
      receiveTimeout: 3000,
      connectTimeout: 3000,
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': token,
      },
    );
    
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("/login")
  Future<CoreRes<User>> auth(@Body() Map<String, dynamic> body);

  @GET("/user")
  Future<CoreRes<User>> getUser();

  @GET("/plans")
  Future<CoreRes<List<Plan>>> history(@Query("status") String status);
}