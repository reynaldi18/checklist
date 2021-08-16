import 'package:flutter/material.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/custom_tabbar.dart';
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
            child: Column(
              children: [
                Container(
                  height: SDP.sdp(135),
                  child: Stack(
                    children: [
                      Container(
                        height: SDP.sdp(98),
                        width: screenWidth(context),
                        color: mainColor,
                        child: Padding(
                          padding: EdgeInsets.all(SDP.sdp(defaultPadding)),
                          child: Text(
                            'Name',
                            style: whiteTextStyle.copyWith(
                              fontSize: SDP.sdp(14),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SDP.sdp(defaultPadding)),
                          child: Container(
                            height: SDP.sdp(74),
                            width: screenWidth(context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(SDP.sdp(4)),
                              boxShadow: [shadow],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(SDP.sdp(10)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "1",
                                          style: mainTextStyle.copyWith(
                                            fontSize: SDP.sdp(18),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          Strings.labelPlan,
                                          style: blackTextStyle.copyWith(
                                            fontSize: SDP.sdp(10),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: SDP.sdp(1),
                                    height: screenHeight(context),
                                    color: grey,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          '2',
                                          style: mainTextStyle.copyWith(
                                            fontSize: SDP.sdp(18),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          Strings.labelOnProgress,
                                          style: blackTextStyle.copyWith(
                                            fontSize: SDP.sdp(10),
                                            fontWeight: FontWeight.w400,
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
                  selectedIndex: vm.selectedPage,
                  onTap: (index) {
                    setState(() {
                      vm.selectedPage = index;
                    });
                  },
                ),
                verticalSpace(SDP.sdp(18)),
                vm.selectedPage == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SDP.sdp(defaultPadding),
                        ),
                        child: Column(
                          children: [
                            PlanCard(),
                            verticalSpace(SDP.sdp(14)),
                            PlanCard(),
                            verticalSpace(SDP.sdp(14)),
                            PlanCard(),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
