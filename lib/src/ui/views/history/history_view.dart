import 'package:flutter/material.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/custom_appbar.dart';
import 'package:stacked/stacked.dart';

import 'history_viewmodel.dart';

class HistoryView extends StatelessWidget {
  HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<HistoryViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: CustomAppBar(
          title: Strings.labelHistory,
          center: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SDP.sdp(defaultPadding),
              vertical: SDP.sdp(defaultPaddingSmall),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SDP.sdp(8)),
                    border: Border.all(color: black),
                  ),
                  child: TextField(
                    controller: vm.searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                        SDP.sdp(12),
                        SDP.sdp(10),
                        0,
                        SDP.sdp(10),
                      ),
                      suffixIcon: vm.searchController.text.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                Icons.search,
                                color: black,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                vm.searchController.clear();
                              },
                              child: Icon(
                                Icons.clear,
                                color: failed,
                              ),
                            ),
                      border: InputBorder.none,
                      hintStyle: greyTextStyle.copyWith(
                        color: grey,
                        fontSize: SDP.sdp(10),
                      ),
                      hintText: Strings.hintSearchRoad,
                    ),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    verticalSpace(SDP.sdp(defaultPaddingSmall)),
                    Container(
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(SDP.sdp(8)),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 15,
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(SDP.sdp(8)),
                        child: Text('data'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HistoryViewModel(),
    );
  }
}
