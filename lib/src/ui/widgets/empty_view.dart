import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/images.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';

class ErrorView extends StatelessWidget {
  final bool half;

  const ErrorView({
    Key? key,
    this.half = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Container(
      height: half == false
          ? screenHeight(context)
          : screenHeightPercentage(
              context,
              percentage: 0.5,
            ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconReload,
              color: grey,
              width: SDP.sdp(51),
            ),
            verticalSpace(SDP.sdp(8)),
            Text(
              Strings.labelError,
              style: greyTextStyle.copyWith(
                fontSize: SDP.sdp(12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
