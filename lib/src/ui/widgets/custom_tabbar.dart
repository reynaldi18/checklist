import 'package:flutter/material.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';

class CustomTabBar extends StatelessWidget {
  final int? selectedIndex;
  final Function(int) onTap;

  CustomTabBar({this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Container(
              width: screenWidthPercentage(
                context,
                percentage: 0.42,
              ),
              height: SDP.sdp(28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SDP.sdp(4)),
                  bottomLeft: Radius.circular(SDP.sdp(4)),
                ),
                color: (selectedIndex == 0) ? mainColor : white,
                border: Border.all(color: mainColor),
              ),
              child: Center(
                child: Text(
                  Strings.labelPlan,
                  style: (selectedIndex == 0)
                      ? whiteTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: SDP.sdp(12),
                        )
                      : mainTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: SDP.sdp(12),
                        ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Container(
              width: screenWidthPercentage(
                context,
                percentage: 0.42,
              ),
              height: SDP.sdp(28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(SDP.sdp(4)),
                  bottomRight: Radius.circular(SDP.sdp(4)),
                ),
                color: (selectedIndex == 1) ? mainColor : white,
                border: Border.all(color: mainColor),
              ),
              child: Center(
                child: Text(
                  Strings.labelOnProgress,
                  style: (selectedIndex == 1)
                      ? whiteTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: SDP.sdp(12),
                        )
                      : mainTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: SDP.sdp(12),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
