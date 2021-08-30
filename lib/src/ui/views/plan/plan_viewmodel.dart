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
      budget = formatCurrency.format(result?.data?.budget);
      if (result?.data?.execution != null)
        cost = formatCurrency.format(result?.data?.execution?.cost);
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
        var fileImage = File('${(await getTemporaryDirectory()).path}/${images[i].name}');
        final file = await fileImage.writeAsBytes(
            byteData.buffer
                .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
        var base64Image = base64Encode(file.readAsBytesSync());
        print('Data: $base64Image');
        addImages.add(base64Image);
      }
    }
  }
}
