import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/custom_tabbar.dart';
import 'package:si_jaja/src/ui/widgets/empty_view.dart';
import 'package:si_jaja/src/ui/widgets/error_view.dart';
import 'package:si_jaja/src/ui/widgets/plan_card.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: vm.isBusy == true
              ? SpinKitFadingCircle(
                  size: SDP.sdp(defaultSize),
                  color: mainColor,
                )
              : !vm.hasError
                  ? RefreshIndicator(
                      key: vm.refreshIndicatorKey,
                      onRefresh: () => vm.refresh(),
                      child: vm.dataReady
                          ? ListView(
                              children: [
                                Container(
                                  height: SDP.sdp(135),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: SDP.sdp(98),
                                        width: screenWidth(context),
                                        color: mainColor,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  SDP.sdp(defaultPadding)),
                                          child: Container(
                                            height: SDP.sdp(74),
                                            width: screenWidth(context),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      SDP.sdp(4)),
                                              boxShadow: [shadow],
                                            ),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(SDP.sdp(10)),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              vm.data?.planning
                                                                      .toString() ??
                                                                  '-',
                                                              style:
                                                                  mainTextStyle
                                                                      .copyWith(
                                                                fontSize:
                                                                    SDP.sdp(14),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            horizontalSpace(
                                                                SDP.sdp(4)),
                                                            Text(
                                                              Strings.labelPlan,
                                                              style:
                                                                  blackTextStyle
                                                                      .copyWith(
                                                                fontSize:
                                                                    SDP.sdp(10),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          vm.budget ?? '-',
                                                          style: mainTextStyle
                                                              .copyWith(
                                                            fontSize:
                                                                SDP.sdp(10),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: SDP.sdp(1),
                                                    height:
                                                        screenHeight(context),
                                                    color: grey,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              vm.data?.ongoing
                                                                      .toString() ??
                                                                  '-',
                                                              style:
                                                                  mainTextStyle
                                                                      .copyWith(
                                                                fontSize:
                                                                    SDP.sdp(14),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            horizontalSpace(
                                                                SDP.sdp(4)),
                                                            Text(
                                                              Strings
                                                                  .labelOnProgress,
                                                              style:
                                                                  blackTextStyle
                                                                      .copyWith(
                                                                fontSize:
                                                                    SDP.sdp(10),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          vm.cost ?? '-',
                                                          style: mainTextStyle
                                                              .copyWith(
                                                            fontSize:
                                                                SDP.sdp(10),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                verticalSpace(SDP.sdp(18)),
                                CustomTabBar(
                                  selectedIndex: vm.selectedIndex,
                                  onTap: (index) {
                                    setState(() {
                                      vm.selectedIndex = index;
                                      vm.getPlans();
                                    });
                                  },
                                ),
                                verticalSpace(SDP.sdp(18)),
                                vm.selectedIndex == 0
                                    ? Container(
                                        color: white,
                                        child: vm.loadingTab == true
                                            ? Container(
                                                height: screenHeightPercentage(
                                                  context,
                                                  percentage: 0.5,
                                                ),
                                                child: SpinKitFadingCircle(
                                                  size: SDP.sdp(defaultSize),
                                                  color: mainColor,
                                                ),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      SDP.sdp(defaultPadding),
                                                ),
                                                child:
                                                    vm.planPlanning!.isNotEmpty
                                                        ? Column(
                                                            children: vm
                                                                .planPlanning!
                                                                .map((item) =>
                                                                    GestureDetector(
                                                                      onTap: () =>
                                                                          vm.viewPlan(item.id ??
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          bottom:
                                                                              SDP.sdp(defaultPaddingSmall),
                                                                        ),
                                                                        child: PlanCard(
                                                                            plan:
                                                                                item),
                                                                      ),
                                                                    ))
                                                                .toList(),
                                                          )
                                                        : EmptyView(),
                                              ),
                                      )
                                    : Container(
                                        color: white,
                                        child: vm.loadingTab == true
                                            ? Container(
                                                height: screenHeightPercentage(
                                                  context,
                                                  percentage: 0.5,
                                                ),
                                                child: SpinKitFadingCircle(
                                                  size: SDP.sdp(defaultSize),
                                                  color: mainColor,
                                                ),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      SDP.sdp(defaultPadding),
                                                ),
                                                child:
                                                    vm.planOngoing!.isNotEmpty
                                                        ? Column(
                                                            children: vm
                                                                .planOngoing!
                                                                .map((item) =>
                                                                    GestureDetector(
                                                                      onTap: () =>
                                                                          vm.viewPlan(item.id ??
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          bottom:
                                                                              SDP.sdp(defaultPaddingSmall),
                                                                        ),
                                                                        child: PlanCard(
                                                                            plan:
                                                                                item),
                                                                      ),
                                                                    ))
                                                                .toList(),
                                                          )
                                                        : EmptyView(),
                                              ),
                                      ),
                              ],
                            )
                          : GestureDetector(
                              onTap: () => vm.refresh(),
                              child: ErrorView(),
                            ),
                    )
                  : GestureDetector(
                      onTap: () => vm.refresh(),
                      child: ErrorView(),
                    ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
