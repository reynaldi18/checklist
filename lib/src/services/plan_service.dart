import 'dart:convert';

import 'package:advance_image_picker/models/image_object.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:si_jaja/src/helpers/http/http_helper.dart';
import 'package:si_jaja/src/models/dashboard.dart';
import 'package:si_jaja/src/models/id.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/network/api_service.dart';
import 'package:si_jaja/src/network/requests/execution_req.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:si_jaja/src/network/responses/upload_res.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class PlanService {
  final logger = Logger();
  ApiService apiService = ApiService(Dio());

  Future<CoreRes<List<Plan>>?> fetchHistory(String? name) async {
    try {
      final data = await apiService
          .histories(name ?? '')
          .then((value) => value)
          .catchError((e) {
        logger.e(e);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes<List<Plan>>?> fetchRoads(String status) async {
    try {
      final data =
          await apiService.roads(status).then((value) => value).catchError((e) {
        logger.e(e);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes<Plan>?> fetchDetail(int id) async {
    try {
      final data = await apiService
          .getRoadDetail(id)
          .then((value) => value)
          .catchError((e) {
        logger.e(e);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes<Dashboard>?> fetchSummaries() async {
    try {
      final data = await apiService
          .getSummaries()
          .then((value) => value)
          .catchError((e) {
        logger.e(e);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes<Id>?> execution(
    int id,
    String width,
    String length,
    String cost,
    String executor,
    String executorContact,
    String startAt,
    String endAt,
    String supervisor,
  ) async {
    try {
      final Map<String, dynamic> req = ExecutionReq(
        width: width,
        length: length,
        cost: cost,
        executor: executor,
        executorContact: executorContact,
        startAt: startAt,
        endAt: endAt,
        supervisor: supervisor,
      ).toJson();
      final data = await apiService.execution(id, req);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes?> executionDone(int id) async {
    try {
      final data =
          await apiService.done(id).then((value) => value).catchError((e) {
        logger.e(e);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<UploadRes?> uploadImages(int id, List<ImageObject> images) async {
    try {
      String? token = HttpHelper().getToken();

      Map<String, dynamic> bodyReq = {};

      images.asMap().forEach((key, value) {
        MultipartFile file = MultipartFile.fromFileSync(value.originalPath);
        bodyReq.addAll({'images[$key]': file});
        print('Image: ${value.originalPath}');
      });

      print('REQ: $bodyReq');

      FormData formData = FormData.fromMap(bodyReq);

      var dio = Dio();
      Response response = await dio.post(
        'http://116.193.191.117:8000/api/progressions/$id/upload',
        data: formData,
        options: Options(
          contentType: "multipart/form-data",
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
        ),
      );

      print(response.statusCode);

      var data = json.decode(response.toString());

      print('DATA: $data');

      UploadRes resp = UploadRes.fromJson(data);

      return resp;
    } catch (e) {
      print(e);
    }
  }
}
