import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/custom_appbar.dart';
import 'package:si_jaja/src/ui/widgets/empty_view.dart';
import 'package:si_jaja/src/ui/widgets/error_view.dart';
import 'package:si_jaja/src/ui/widgets/history_card.dart';
import 'package:stacked/stacked.dart';

import 'history_viewmodel.dart';

class HistoryView extends StatelessWidget {
  HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<HistoryViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: CustomAppBar(
          title: Strings.labelHistory,
          center: true,
          child: RefreshIndicator(
            key: vm.refreshIndicatorKey,
            onRefresh: () => vm.histories(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SDP.sdp(defaultPadding),
                vertical: SDP.sdp(defaultPaddingSmall),
              ),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(SDP.sdp(8)),
                      border: Border.all(color: black),
                    ),
                    child: TextField(
                      controller: vm.searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                          SDP.sdp(12),
                          SDP.sdp(10),
                          0,
                          SDP.sdp(10),
                        ),
                        suffixIcon: vm.searchController.text.isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: Icon(
                                  Icons.search,
                                  color: black,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  vm.searchController.clear();
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: failed,
                                ),
                              ),
                        border: InputBorder.none,
                        hintStyle: greyTextStyle.copyWith(
                          color: grey,
                          fontSize: SDP.sdp(10),
                        ),
                        hintText: Strings.hintSearchRoad,
                      ),
                    ),
                  ),
                  vm.isBusy
                      ? Container(
                          height: screenHeightPercentage(
                            context,
                            percentage: 0.6,
                          ),
                          child: SpinKitFadingCircle(
                            size: SDP.sdp(defaultSize),
                            color: mainColor,
                          ),
                        )
                      : !vm.hasError
                          ? vm.plans != null
                              ? Column(
                                  children: [
                                    verticalSpace(SDP.sdp(defaultPaddingSmall)),
                                    vm.plans!.isNotEmpty
                                        ? Column(
                                            children: vm.plans!.map((e) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    vm.viewPlan(e.id ?? 0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: SDP.sdp(
                                                        defaultPaddingSmall),
                                                  ),
                                                  child: HistoryCard(plan: e),
                                                ),
                                              );
                                            }).toList(),
                                          )
                                        : EmptyView()
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () => vm.histories(),
                                  child: ErrorView(half: true),
                                )
                          : GestureDetector(
                              onTap: () => vm.histories(),
                              child: ErrorView(half: true),
                            )
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HistoryViewModel(),
    );
  }
}
