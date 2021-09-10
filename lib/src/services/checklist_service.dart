import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:si_jaja/src/models/checklist.dart';
import 'package:si_jaja/src/network/api_service.dart';
import 'package:si_jaja/src/network/requests/checklist_req.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class ChecklistService {
  final logger = Logger();
  ApiService apiService = ApiService(Dio());

  Future<CoreRes<List<Checklist>>?> getChecklist() async {
    try {
      final data = await apiService.fetchChecklist();
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes<Checklist>?> setChecklist(
    String name,
  ) async {
    try {
      final Map<String, dynamic> req = ChecklistReq(name: name).toJson();
      final data = await apiService.checklist(req);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<CoreRes?> delete(int id) async {
    try {
      final data = await apiService.deleteChecklist(id);
      return data;
    } catch (e) {
      print(e);
    }
  }
}
