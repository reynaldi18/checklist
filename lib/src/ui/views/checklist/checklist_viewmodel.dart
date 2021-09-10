import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/checklist.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:si_jaja/src/services/checklist_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChecklistViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _checklistService = locator<ChecklistService>();

  List<Checklist>? data;

  @override
  Future futureToRun() => fetchChecklist();

  Future<List<Checklist>?> fetchChecklist() async {
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      setBusy(true);
      final result = await _checklistService.getChecklist();
      if (result!.data != null) data = result.data;
      setBusy(false);
      return result.data;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  Future<CoreRes?> delete(int id) async {
    final hasConnection = await ConnectionHelper.hasConnection();
    if (hasConnection) {
      setBusy(true);
      final result = await _checklistService.delete(id);
      if (result!.data != null) fetchChecklist();
      setBusy(false);
      return result.data;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  void create() => _navigationService
      .navigateTo(Routes.checklistCreateView)
      ?.then((value) => fetchChecklist());
}
