import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:si_jaja/src/ui/shared/images.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightPercentage(context,
          percentage: 0.5),
      child: Center(
        child: SvgPicture.asset(
          iconEmpty,
          color: grey,
        ),
      ),
    );
  }
}