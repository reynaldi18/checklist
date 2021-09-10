
import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/checklist.dart';
import 'package:si_jaja/src/network/responses/core_res.dart';
import 'package:si_jaja/src/services/checklist_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChecklistCreateViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _checklistService = locator<ChecklistService>();

  final TextEditingController nameController = TextEditingController();
  bool nameValidate = false;

  Future<CoreRes<Checklist>?> create() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    nameValidate = false;
    if (nameController.text.isEmpty)
      nameValidate = true;
    else {
      if (hasConnection) {
        setBusy(true);
        final result = await _checklistService.setChecklist(nameController.text);
        print('RESULT: $result');
        if (result!.statusCode! >= 2000 ) _navigationService.back();
        setBusy(false);
        return result;
      } else
        ConnectionHelper.showNotConnectionSnackBar();
    }
    notifyListeners();
  }
}
