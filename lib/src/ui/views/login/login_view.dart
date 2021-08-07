import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/images.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/button.dart';
import 'package:si_jaja/src/ui/widgets/text_field.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SDP.sdp(defaultPadding),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      logo,
                      width: SDP.sdp(100),
                      height: SDP.sdp(100),
                    ),
                    verticalSpace(SDP.sdp(14)),
                    Text(
                      Strings.labelApp,
                      style: blackTextStyle.copyWith(
                        fontSize: SDP.sdp(34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(SDP.sdp(14)),
                    CustomTextField(
                      label: Strings.hintName,
                      controller: vm.emailController,
                      validate: vm.emailValidate,
                      errorLabel: Strings.errorEmptyEmail,
                    ),
                    verticalSpace(SDP.sdp(14)),
                    CustomTextField(
                      label: Strings.hintPassword,
                      controller: vm.passwordController,
                      validate: vm.passwordValidate,
                      errorLabel: Strings.errorEmptyPassword,
                      password: true,
                    ),
                    verticalSpace(SDP.sdp(24)),
                    vm.isBusy == true
                        ? SpinKitFadingCircle(
                            size: SDP.sdp(buttonHeight),
                            color: mainColor,
                          )
                        : CustomButton(
                            label: Strings.actionLogin.toUpperCase(),
                            onPress: () => vm.login(),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
