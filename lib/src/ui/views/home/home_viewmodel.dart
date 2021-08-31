import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/constant/config.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/dashboard.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/services/plan_service.dart';
import 'package:si_jaja/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:intl/intl.dart';

const String _UserData = 'delayedUser';
const String _Planning = 'delayedPlanning';
const String _Ongoing = 'delayedOngoing';
const String _Summaries = 'delayedSummaries';

class HomeViewModel extends MultipleFutureViewModel {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _planService = locator<PlanService>();

  User? get fetchUser => dataMap?[_UserData];

  List<Plan>? get fetchPlanning => dataMap?[_Planning];

  List<Plan>? get fetchOngoing => dataMap?[_Ongoing];

  Dashboard? get fetchSummaries => dataMap?[_Summaries];

  bool get fetchingUser => busy(_UserData);

  bool get fetchingPlanning => busy(_Planning);

  bool get fetchingOngoing => busy(_Ongoing);

  bool get fetchingSummaries => busy(_Summaries);

  int selectedIndex = 0;
  String? budget;
  String? cost;

  Future<void> refresh() async {
    _navigationService.replaceWith(Routes.mainView);
  }

  @override
  Map<String, Future Function()> get futuresMap => {
        _UserData: getUserData,
        _Planning: getPlanning,
        _Ongoing: getOngoing,
        _Summaries: getSummaries,
      };

  Future<User?> getUserData() async {
    var user = await _userService.getUser();
    return user;
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
      notifyListeners();
      return result?.data;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  Future<Dashboard?> getSummaries() async {
    final hasConnection = await ConnectionHelper.hasConnection();
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

    if (hasConnection) {
      final result = await _planService.fetchSummaries();
      // var budgetData = double.parse(result?.data?.budget ?? '');
      // var costData = double.parse(result?.data?.cost ?? '');
      budget = formatCurrency.format(result?.data?.budget);
      cost = formatCurrency.format(result?.data?.cost);
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
