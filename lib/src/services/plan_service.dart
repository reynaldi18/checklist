import 'package:dio/dio.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/network/api_service.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class PlanService {
  ApiService apiService = ApiService(Dio());

  Future<CoreRes<List<Plan>>?> fetchUser(String status) async {
    try {
      final data = await apiService.history(status);
      return data;
    } catch (e) {
      print(e);
    }
  }
}