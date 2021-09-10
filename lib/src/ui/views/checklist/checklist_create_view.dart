import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/button.dart';
import 'package:si_jaja/src/ui/widgets/text_field.dart';
import 'package:stacked/stacked.dart';

import 'checklist_create_viewmodel.dart';

class ChecklistCreateView extends StatelessWidget {
  ChecklistCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<ChecklistCreateViewModel>.reactive(
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
                    CustomTextField(
                      label: Strings.hintName,
                      controller: vm.nameController,
                      validate: vm.nameValidate,
                      errorLabel: Strings.errorEmptyName,
                    ),
                    verticalSpace(SDP.sdp(24)),
                    vm.isBusy == true
                        ? SpinKitFadingCircle(
                            size: SDP.sdp(defaultSize),
                            color: mainColor,
                          )
                        : CustomButton(
                            label: Strings.actionCreateChecklist,
                            onPress: () => vm.create(),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChecklistCreateViewModel(),
    );
  }
}
