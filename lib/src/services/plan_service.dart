import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/network/api_service.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
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
      final data =
      await apiService.getRoadDetail(id).then((value) => value).catchError((e) {
        logger.e(e);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }
}
