// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/checklist/checklist_create_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/regis/regis_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String loginView = '/login-view';
  static const String regisView = '/regis-view';
  static const String mainView = '/main-view';
  static const String checklistCreateView = '/checklist-create-view';
  static const all = <String>{
    splashScreenView,
    loginView,
    regisView,
    mainView,
    checklistCreateView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.regisView, page: RegisView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.checklistCreateView, page: ChecklistCreateView),
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
    RegisView: (data) {
      var args = data.getArgs<RegisViewArguments>(
        orElse: () => RegisViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisView(key: args.key),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    ChecklistCreateView: (data) {
      var args = data.getArgs<ChecklistCreateViewArguments>(
        orElse: () => ChecklistCreateViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChecklistCreateView(key: args.key),
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

/// RegisView arguments holder class
class RegisViewArguments {
  final Key? key;
  RegisViewArguments({this.key});
}

/// ChecklistCreateView arguments holder class
class ChecklistCreateViewArguments {
  final Key? key;
  ChecklistCreateViewArguments({this.key});
}
