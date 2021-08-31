import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/services/plan_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HistoryViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _planService = locator<PlanService>();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  TextEditingController searchController = TextEditingController();

  List<Plan>? plans;

  @override
  Future futureToRun() => histories();

  Future histories() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      setBusy(true);
      var result = await _planService.fetchHistory(searchController.text);
      plans = result?.data;
      setBusy(false);
      return result;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  void viewPlan(int id) => _navigationService.navigateTo(
        Routes.planView,
        arguments: PlanViewArguments(id: id),
      );
}
