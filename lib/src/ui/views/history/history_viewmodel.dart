import 'package:flutter/material.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/services/plan_service.dart';
import 'package:stacked/stacked.dart';

class HistoryViewModel extends BaseViewModel {
  final _planService = locator<PlanService>();

  TextEditingController searchController = TextEditingController();
  bool searchValidate = false;

  List<Plan>? plans;
}
