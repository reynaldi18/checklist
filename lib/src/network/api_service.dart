import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:si_jaja/src/helpers/http/http_helper.dart';
import 'package:si_jaja/src/models/auth.dart';
import 'package:si_jaja/src/models/dashboard.dart';
import 'package:si_jaja/src/models/execution.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://116.193.191.117:8000/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    String? token = HttpHelper().getToken();
    dio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("/oauth/token")
  Future<Auth> auth(@Body() Map<String, dynamic> body);

  @GET("/api/user")
  Future<CoreRes<User>> getUser();

  @GET("/api/roads")
  Future<CoreRes<List<Plan>>> roads(@Query("status") String status);

  @GET("/api/histories")
  Future<CoreRes<List<Plan>>> histories(@Query("name") String name);

  @GET("/api/roads/{id}")
  Future<CoreRes<Plan>> getRoadDetail(@Path("id") int id);

  @GET("/api/summaries")
  Future<CoreRes<Dashboard>> getSummaries();

  @POST("/api/progressions/{id}")
  Future<CoreRes<Execution>> execution(
    @Path("id") int id,
    @Body() Map<String, dynamic> body,
  );

  @POST("/api/progressions/{id}/done")
  Future<CoreRes> done(@Path("id") int id);
}
