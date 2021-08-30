import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:si_jaja/src/constant/config.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/button.dart';
import 'package:si_jaja/src/ui/widgets/custom_appbar.dart';
import 'package:si_jaja/src/ui/widgets/text_field.dart';
import 'package:si_jaja/src/ui/widgets/text_field_number.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

import 'plan_viewmodel.dart';

class PlanView extends StatefulWidget {
  final int id;

  PlanView({Key? key, required this.id}) : super(key: key);

  @override
  _PlanViewState createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<PlanViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: vm.isBusy
            ? SpinKitFadingCircle(
                size: SDP.sdp(defaultSize),
                color: mainColor,
              )
            : CustomAppBar(
                title: vm.plan?.execution == null
                    ? Strings.labelPlan
                    : Strings.labelOnProgress,
                center: true,
                back: true,
                child: RefreshIndicator(
                  key: vm.refreshIndicatorKey,
                  onRefresh: () => vm.getPlan(),
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.labelRoadName,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(8),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(2)),
                                  Text(
                                    vm.plan?.name ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(10),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              vm.plan?.status ?? '',
                              style: blackTextStyle.copyWith(
                                  fontSize: SDP.sdp(10),
                                  fontWeight: FontWeight.w600,
                                  color: success),
                            )
                          ],
                        ),
                        verticalSpace(SDP.sdp(10)),
                        Text(
                          Strings.labelAddress,
                          style: blackTextStyle.copyWith(
                            fontSize: SDP.sdp(8),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        verticalSpace(SDP.sdp(2)),
                        Text(
                          vm.plan?.address ?? '',
                          style: blackTextStyle.copyWith(
                            fontSize: SDP.sdp(10),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        verticalSpace(SDP.sdp(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.labelRoadWidth,
                                  style: blackTextStyle.copyWith(
                                    fontSize: SDP.sdp(8),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                verticalSpace(SDP.sdp(2)),
                                Text(
                                  '${vm.plan?.roadWidth.toString() ?? ''} Meter',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackTextStyle.copyWith(
                                    fontSize: SDP.sdp(10),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.labelRoadLength,
                                  style: blackTextStyle.copyWith(
                                    fontSize: SDP.sdp(8),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                verticalSpace(SDP.sdp(2)),
                                Text(
                                  '${vm.plan?.roadLength.toString() ?? ''} Meter',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackTextStyle.copyWith(
                                    fontSize: SDP.sdp(10),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        verticalSpace(SDP.sdp(10)),
                        Text(
                          Strings.labelBudget,
                          style: blackTextStyle.copyWith(
                            fontSize: SDP.sdp(8),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          vm.budget ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: blackTextStyle.copyWith(
                            fontSize: SDP.sdp(14),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        verticalSpace(SDP.sdp(defaultPadding)),
                        Center(
                          child: Text(
                            Strings.labelOnProgress,
                            style: blackTextStyle.copyWith(
                              fontSize: SDP.sdp(14),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        verticalSpace(SDP.sdp(defaultPadding)),
                        vm.plan?.execution == null
                            ? Column(
                                children: [
                                  NumberTextField(
                                    label: Strings.labelRoadWidth,
                                    controller: vm.roadWidthController,
                                    validate: vm.roadWidthValidate,
                                    errorLabel: Strings.errorEmptyRoadWidth,
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  NumberTextField(
                                    label: Strings.labelRoadLength,
                                    controller: vm.roadLengthController,
                                    validate: vm.roadLengthValidate,
                                    errorLabel: Strings.errorEmptyRoadLength,
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  NumberTextField(
                                    label: Strings.labelCost,
                                    controller: vm.costController,
                                    validate: vm.costValidate,
                                    errorLabel: Strings.errorEmptyCost,
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  CustomTextField(
                                    label: Strings.labelExecutor,
                                    controller: vm.executorController,
                                    validate: vm.executorValidate,
                                    errorLabel: Strings.errorEmptyExecutor,
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  NumberTextField(
                                    label: Strings.labelExecutorContact,
                                    controller: vm.executorContactController,
                                    validate: vm.executorContactValidate,
                                    errorLabel:
                                        Strings.errorEmptyExecutorContact,
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  CustomTextField(
                                    label: Strings.labelSupervisor,
                                    controller: vm.supervisorController,
                                    validate: vm.supervisorValidate,
                                    errorLabel: Strings.errorEmptySupervisor,
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(SDP.sdp(8)),
                                          side: BorderSide(
                                            color: greySoft,
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      elevation: 0,
                                      primary: Colors.transparent,
                                    ),
                                    onPressed: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        initialDatePickerMode:
                                            DatePickerMode.day,
                                        firstDate: DateTime(1800),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null)
                                        setState(() {
                                          vm.startDate =
                                              DateFormat(Config.dateFormat)
                                                  .format(picked);
                                        });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: SDP.sdp(10.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            vm.startDate ??
                                                Strings.labelStartDate,
                                            style: blackTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(SDP.sdp(8)),
                                          side: BorderSide(
                                            color: greySoft,
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      elevation: 0,
                                      primary: Colors.transparent,
                                    ),
                                    onPressed: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        initialDatePickerMode:
                                            DatePickerMode.day,
                                        firstDate: DateTime(1800),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null)
                                        setState(() {
                                          vm.endDate =
                                              DateFormat(Config.dateFormat)
                                                  .format(picked);
                                        });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: SDP.sdp(10.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            vm.endDate ?? Strings.labelEndDate,
                                            style: blackTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  Text(
                                    Strings.labelImage,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(10),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(2)),
                                  vm.images.isNotEmpty
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          crossAxisCount: 3,
                                          children: List.generate(
                                              vm.images.length, (index) {
                                            Asset asset = vm.images[index];
                                            return Padding(
                                              padding: EdgeInsets.all(
                                                SDP.sdp(8),
                                              ),
                                              child: AssetThumb(
                                                asset: asset,
                                                width: 300,
                                                height: 300,
                                              ),
                                            );
                                          }),
                                        )
                                      : Container(),
                                  TextButton(
                                    onPressed: () => vm.loadAssets(),
                                    child: Text(
                                      Strings.labelInsertImage,
                                      style: blackTextStyle.copyWith(
                                          fontSize: SDP.sdp(12),
                                          fontWeight: FontWeight.bold,
                                          color: mainColor),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Strings.labelRoadWidth,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(8),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(2)),
                                          Text(
                                            '${vm.plan?.execution?.roadWidth.toString() ?? ''} Meter',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(10)),
                                          Text(
                                            Strings.labelExecutor,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(8),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(2)),
                                          Text(
                                            vm.plan?.execution?.executor ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(10)),
                                          Text(
                                            Strings.labelStartDate,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(8),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(2)),
                                          Text(
                                            vm.plan?.execution?.startAt ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Strings.labelRoadLength,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(8),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(2)),
                                          Text(
                                            '${vm.plan?.execution?.roadLength.toString() ?? ''} Meter',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(10)),
                                          Text(
                                            Strings.labelExecutorContact,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(8),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(2)),
                                          Text(
                                            vm.plan?.execution
                                                    ?.executorContact ??
                                                '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(10)),
                                          Text(
                                            Strings.labelEndDate,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(8),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          verticalSpace(SDP.sdp(2)),
                                          Text(
                                            vm.plan?.execution?.endAt ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: blackTextStyle.copyWith(
                                              fontSize: SDP.sdp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  Text(
                                    Strings.labelSupervisor,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(8),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(2)),
                                  Text(
                                    vm.plan?.execution?.supervisor ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(10),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  Text(
                                    Strings.labelCost,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(8),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(2)),
                                  Text(
                                    vm.cost ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(14),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(10)),
                                  Text(
                                    Strings.labelImage,
                                    style: blackTextStyle.copyWith(
                                      fontSize: SDP.sdp(8),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(2)),
                                  vm.plan!.execution!.images!.isNotEmpty
                                      ? Container(
                                          height: SDP.sdp(62),
                                          child: ListView(
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            children: vm
                                                .plan!.execution!.images!
                                                .map(
                                                  (item) => Padding(
                                                    padding: EdgeInsets.only(
                                                      right: SDP.sdp(12),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          screenWidthPercentage(
                                                        context,
                                                        percentage: 0.4,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          SDP.sdp(8),
                                                        ),
                                                        boxShadow: [shadow],
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    SDP.sdp(8)),
                                                        child: Image.network(
                                                          item,
                                                          fit: BoxFit.cover,
                                                          width: screenWidth(
                                                              context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                        verticalSpace(SDP.sdp(defaultPadding)),
                        CustomButton(
                          label: vm.plan?.execution == null
                              ? Strings.labelOnProgress.toUpperCase()
                              : Strings.labelDone.toUpperCase(),
                          onPress: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      viewModelBuilder: () => PlanViewModel(id: widget.id),
    );
  }
}
