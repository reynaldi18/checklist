import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/images.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/views/history/history_view.dart';
import 'package:si_jaja/src/ui/views/home/home_view.dart';
import 'package:si_jaja/src/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: vm.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(vm.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          currentIndex: vm.currentIndex,
          selectedItemColor: mainColor,
          unselectedItemColor: black,
          selectedFontSize: SDP.sdp(12),
          unselectedFontSize: SDP.sdp(12),
          onTap: vm.setIndex,
          items: [
            BottomNavigationBarItem(
              label: Strings.labelHome,
              icon: Padding(
                padding: EdgeInsets.all(SDP.sdp(8)),
                child: SvgPicture.asset(
                  iconHome,
                  width: SDP.sdp(iconSize),
                  color: black,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(SDP.sdp(8)),
                child: SvgPicture.asset(
                  iconHome,
                  width: SDP.sdp(iconSize),
                  color: mainColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: Strings.labelHistory,
              icon: Padding(
                padding: EdgeInsets.all(SDP.sdp(8)),
                child: SvgPicture.asset(
                  iconHistory,
                  width: SDP.sdp(iconSize),
                  color: black,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(SDP.sdp(8)),
                child: SvgPicture.asset(
                  iconHistory,
                  width: SDP.sdp(iconSize),
                  color: mainColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: Strings.labelAccount,
              icon: Padding(
                padding: EdgeInsets.all(SDP.sdp(8)),
                child: SvgPicture.asset(
                  iconAccount,
                  width: SDP.sdp(iconSize),
                  color: black,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(SDP.sdp(8)),
                child: SvgPicture.asset(
                  iconAccount,
                  width: SDP.sdp(iconSize),
                  color: mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return HistoryView();
      case 2:
        return ProfileView();
      default:
        return HomeView();
    }
  }
}
