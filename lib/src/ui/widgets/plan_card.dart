import 'package:flutter/material.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/models/plan.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';

class PlanCard extends StatelessWidget {
  final Plan plan;

  const PlanCard({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Container(
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(SDP.sdp(8)),
        boxShadow: [shadow],
      ),
      child: Padding(
        padding: EdgeInsets.all(SDP.sdp(10)),
        child: Container(
          width: screenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.name ?? '',
                style: blackTextStyle.copyWith(
                  fontSize: SDP.sdp(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(SDP.sdp(2)),
              Text(
                plan.address ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: blackTextStyle.copyWith(
                  fontSize: SDP.sdp(9),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}