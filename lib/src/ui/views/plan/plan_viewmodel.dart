import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/services/plan_service.dart';
import 'package:stacked/stacked.dart';

class PlanViewModel extends FutureViewModel {
  final int id;

  PlanViewModel({required this.id});

  final _planService = locator<PlanService>();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final TextEditingController roadWidthController = TextEditingController();
  final TextEditingController roadLengthController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController executorController = TextEditingController();
  final TextEditingController executorContactController =
      TextEditingController();
  final TextEditingController supervisorController =
      TextEditingController();
  bool roadWidthValidate = false;
  bool roadLengthValidate = false;
  bool costValidate = false;
  bool executorValidate = false;
  bool executorContactValidate = false;
  bool supervisorValidate = false;

  Plan? plan;
  String? budget;
  String? cost;
  String? startDate;
  String? endDate;

  List<Asset> images = <Asset>[];
  String errorImage = 'No Error Dectected';

  @override
  Future futureToRun() => getPlan();

  Future getPlan() async {
    final hasConnection = await ConnectionHelper.hasConnection();
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

    if (hasConnection) {
      setBusy(true);
      var result = await _planService.fetchDetail(id);
      plan = result?.data;
      budget = formatCurrency.format(result?.data?.budget);
      if (result?.data?.execution != null)
        cost = formatCurrency.format(result?.data?.execution?.cost);
      setBusy(false);
      return result;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }
}
