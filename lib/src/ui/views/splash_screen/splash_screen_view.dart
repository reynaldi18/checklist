import 'package:flutter/material.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/images.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 82,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    logo,
                    width: SDP.sdp(100),
                    height: SDP.sdp(100),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
