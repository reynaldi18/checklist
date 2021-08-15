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

  Future<CoreRes<List<Plan>>?> fetchPlan(String status) async {
    try {
      final data =
          await apiService.plans(status).then((value) => value).catchError((e) {
        logger.e(e);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }
}
