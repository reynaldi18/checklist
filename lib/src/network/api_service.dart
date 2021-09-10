import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:si_jaja/src/helpers/http/http_helper.dart';
import 'package:si_jaja/src/models/auth.dart';
import 'package:si_jaja/src/models/checklist.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://18.139.50.74:8080/')
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

  @POST("/login")
  Future<CoreRes<Auth>> auth(@Body() Map<String, dynamic> body);

  @POST("/register")
  Future<CoreRes> regis(@Body() Map<String, dynamic> body);

  @GET("checklist")
  Future<CoreRes<List<Checklist>>> fetchChecklist();

  @POST("/checklist")
  Future<CoreRes<Checklist>> checklist(@Body() Map<String, dynamic> body);

  @DELETE("/checklist/{checklistId}")
  Future<CoreRes> deleteChecklist(@Path() int checklistId);
}
