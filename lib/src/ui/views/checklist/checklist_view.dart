import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/button.dart';
import 'package:stacked/stacked.dart';

import 'checklist_viewmodel.dart';

class ChecklistView extends StatelessWidget {
  ChecklistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<ChecklistViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: vm.isBusy == true
                ? SpinKitFadingCircle(
                    size: SDP.sdp(defaultSize),
                    color: mainColor,
                  )
                : Stack(
                    children: [
                      ListView(
                        children: [
                          Column(
                            children: vm.data!
                                .map((item) => Padding(
                                      padding:
                                          EdgeInsets.only(bottom: SDP.sdp(12)),
                                      child: Container(
                                        width: screenWidth(context),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(SDP.sdp(8)),
                                          color: white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(SDP.sdp(8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.name ?? '',
                                                style: blackTextStyle,
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () => vm.delete(
                                                      item.id ?? 0,
                                                    ),
                                                    child: Text(
                                                      'Hapus',
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              color: failed,
                                                              fontSize:
                                                                  SDP.sdp(8)),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          label: Strings.actionCreateChecklist,
                          onPress: () => vm.create(),
                        ),
                      ),
                    ],
                  )),
      ),
      viewModelBuilder: () => ChecklistViewModel(),
    );
  }
}
