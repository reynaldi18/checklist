import 'package:flutter/material.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';

class NumberTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final bool password;

  const NumberTextField(
      {Key? key, this.label, this.controller, this.password = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Container(
      height: SDP.sdp(textFieldHeight),
      child: TextField(
        cursorColor: black,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: SDP.sdp(12),
          color: black,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: hint),
          counterStyle: TextStyle(
            color: mainColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SDP.sdp(8)),
            borderSide: BorderSide(
              color: greySoft,
              width: 0.0,
            ),
          ),
          enabled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: greySoft,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SDP.sdp(8)),
            borderSide: BorderSide(
              color: black,
              width: 1,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
