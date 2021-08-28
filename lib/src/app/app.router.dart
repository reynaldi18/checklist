// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/login/login_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/plan/plan_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String loginView = '/login-view';
  static const String mainView = '/main-view';
  static const String planView = '/plan-view';
  static const all = <String>{
    splashScreenView,
    loginView,
    mainView,
    planView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.planView, page: PlanView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreenView: (data) {
      var args = data.getArgs<SplashScreenViewArguments>(
        orElse: () => SplashScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreenView(key: args.key),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    PlanView: (data) {
      var args = data.getArgs<PlanViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlanView(
          key: args.key,
          id: args.id,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SplashScreenView arguments holder class
class SplashScreenViewArguments {
  final Key? key;
  SplashScreenViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// PlanView arguments holder class
class PlanViewArguments {
  final Key? key;
  final int id;
  PlanViewArguments({this.key, required this.id});
}
