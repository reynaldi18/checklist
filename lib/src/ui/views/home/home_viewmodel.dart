import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/app/app.router.dart';
import 'package:si_jaja/src/constant/config.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/models/user.dart';
import 'package:si_jaja/src/services/plan_service.dart';
import 'package:si_jaja/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _UserData = 'delayedUser';
const String _Planning = 'delayedPlanning';
const String _Ongoing = 'delayedOngoing';

class HomeViewModel extends MultipleFutureViewModel {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _planService = locator<PlanService>();

  User? get fetchUser => dataMap?[_UserData];

  List<Plan>? get fetchPlanning => dataMap?[_Planning];

  List<Plan>? get fetchOngoing => dataMap?[_Ongoing];

  bool get fetchingUser => busy(_UserData);

  bool get fetchingPlanning => busy(_Planning);

  bool get fetchingOngoing => busy(_Ongoing);

  int selectedIndex = 0;

  Future<void> refresh() async {
    _navigationService.replaceWith(Routes.mainView);
  }

  @override
  Map<String, Future Function()> get futuresMap => {
        _UserData: getUserData,
        _Planning: getPlanning,
        _Ongoing: getOngoing,
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
}
