import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/constant/config.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/dashboard.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/services/plan_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<Dashboard?> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final _navigationService = locator<NavigationService>();
  final _planService = locator<PlanService>();

  int selectedIndex = 0;
  String? budget;
  String? cost;

  List<Plan>? planPlanning;
  List<Plan>? planOngoing;

  bool loadingTab = true;

  Future<void> refresh() async {
    _navigationService.replaceWith(Routes.mainView);
  }

  @override
  Future<Dashboard?> futureToRun() => getSummaries();

  Future<Dashboard?> getSummaries() async {
    final hasConnection = await ConnectionHelper.hasConnection();
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

    if (hasConnection) {
      final result = await _planService.fetchSummaries();
      budget = formatCurrency.format(result?.data?.budget);
      cost = formatCurrency.format(result?.data?.cost);
      if (result?.success == true) getPlans();
      notifyListeners();
      return result?.data;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  Future<List<Plan>?> getPlans() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      loadingTab = true;
      if (selectedIndex == 0) {
        final result = await _planService.fetchRoads(Config.planning);
        planPlanning = result?.data;
        loadingTab = false;
        notifyListeners();
        return result?.data;
      } else {
        final result = await _planService.fetchRoads(Config.ongoing);
        planOngoing = result?.data;
        loadingTab = false;
        notifyListeners();
        return result?.data;
      }
    } else
      ConnectionHelper.showNotConnectionSnackBar();
  }

  Future<List<Plan>?> getPlanning() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      final result = await _planService.fetchRoads(Config.planning);
      notifyListeners();
      return result?.data;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  Future<List<Plan>?> getOngoing() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      final result = await _planService.fetchRoads(Config.ongoing);
      planOngoing = result?.data;
      notifyListeners();
      return result?.data;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  void viewPlan(int id) => _navigationService.navigateTo(
        Routes.planView,
        arguments: PlanViewArguments(id: id),
      );
}
