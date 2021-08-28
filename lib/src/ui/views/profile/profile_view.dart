import 'package:flutter/material.dart';
import 'package:si_jaja/src/constant/config.dart';
import 'package:si_jaja/src/helpers/scalable_dp.dart';
import 'package:si_jaja/src/ui/shared/dimens.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';
import 'package:si_jaja/src/ui/shared/ui_helpers.dart';
import 'package:si_jaja/src/ui/widgets/custom_appbar.dart';
import 'package:si_jaja/src/ui/widgets/text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: CustomAppBar(
          title: Strings.labelAccount,
          center: true,
          child: Padding(
            padding: EdgeInsets.all(SDP.sdp(defaultPadding)),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                CustomTextField(
                  label: Strings.hintName,
                  controller: vm.nameController,
                  validate: vm.nameValidate,
                  errorLabel: Strings.errorEmptyName,
                ),
                verticalSpace(SDP.sdp(14)),
                CustomTextField(
                  label: Strings.hintEmail,
                  controller: vm.emailController,
                  validate: vm.emailValidate,
                  errorLabel: Strings.errorEmptyEmail,
                ),
                verticalSpace(SDP.sdp(14)),
                CustomTextField(
                  label: Strings.hintPhone,
                  controller: vm.phoneController,
                  validate: vm.phoneValidate,
                  errorLabel: Strings.errorEmptyPhone,
                ),
                verticalSpace(SDP.sdp(14)),
                Container(
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SDP.sdp(8)),
                    border: Border.all(color: greySoft),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SDP.sdp(8),
                      ),
                      child: DropdownButton<String>(
                        value: vm.genderValue,
                        style: TextStyle(color: black),
                        items: <String>[
                          Strings.labelMale,
                          Strings.labelFemale,
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          Strings.hintGender,
                          style: blackTextStyle,
                        ),
                        onChanged: (value) {
                          setState(() {
                            vm.genderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                verticalSpace(SDP.sdp(14)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SDP.sdp(8)),
                        side: BorderSide(
                          color: greySoft,
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                    elevation: 0,
                    primary: Colors.transparent,
                  ),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        initialDatePickerMode: DatePickerMode.day,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101));
                    if (picked != null)
                      setState(() {
                        // selectedDate = picked;
                        vm.date = DateFormat(Config.dateFormat)
                            .format(picked);
                      });

                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: SDP.sdp(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          vm.date ?? Strings.hintBirthDate,
                          style: blackTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
