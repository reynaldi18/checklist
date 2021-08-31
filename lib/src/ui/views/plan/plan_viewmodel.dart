import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/helpers/connection_helper.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/services/plan_service.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/widgets/toast.dart';
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
  final TextEditingController supervisorController = TextEditingController();
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
  List<File> imagesView = [];
  List<String> addImages = [];

  @override
  Future futureToRun() => getPlan();

  Future getPlan() async {
    final hasConnection = await ConnectionHelper.hasConnection();
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

    if (hasConnection) {
      setBusy(true);
      var result = await _planService.fetchDetail(id);
      plan = result?.data;
      var budgetData = double.parse(result?.data?.budget ?? '');
      var costData = double.parse(result?.data?.execution?.cost ?? '');
      budget = formatCurrency.format(budgetData);
      if (result?.data?.execution != null)
        cost = formatCurrency.format(costData);
      setBusy(false);
      return result;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: Strings.labelApp,
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
    images = resultList;
    encodeImage(images);
    notifyListeners();
  }

  Future encodeImage(List<Asset> dataImages) async {
    if (dataImages.length > 0) {
      for (var i = 0; i < dataImages.length; i++) {
        final byteData = await images[i].getByteData();
        var fileImage =
            File('${(await getTemporaryDirectory()).path}/${images[i].name}');
        final file = await fileImage.writeAsBytes(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
        var base64Image = base64Encode(file.readAsBytesSync());
        addImages.add(base64Image);
      }
    }
  }

  void validate() {
    roadWidthValidate = false;
    roadLengthValidate = false;
    costValidate = false;
    executorValidate = false;
    executorContactValidate = false;
    supervisorValidate = false;
    if (roadWidthController.text.isEmpty)
      roadWidthValidate = true;
    else if (roadLengthController.text.isEmpty)
      roadLengthValidate = true;
    else if (costController.text.isEmpty)
      costValidate = true;
    else if (executorController.text.isEmpty)
      executorValidate = true;
    else if (executorContactController.text.isEmpty)
      executorContactValidate = true;
    else if (supervisorController.text.isEmpty)
      supervisorValidate = true;
    else if (startDate == null)
      CustomToast.show(Strings.errorEmptyStartDate);
    else if (endDate == null)
      CustomToast.show(Strings.errorEmptyEndDate);
    else execution();
    notifyListeners();
  }

  Future execution() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      setBusy(true);
      var result = await _planService.execution(
        id,
        roadWidthController.text,
        roadLengthController.text,
        costController.text,
        executorController.text,
        executorContactController.text,
        startDate ?? '',
        endDate ?? '',
        supervisorController.text,
        addImages,
      );
      getPlan();
      setBusy(false);
      return result;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }

  Future executionDone() async {
    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      setBusy(true);
      var result = await _planService.executionDone(id);
      getPlan();
      setBusy(false);
      return result;
    } else
      ConnectionHelper.showNotConnectionSnackBar();
    notifyListeners();
  }
}
