import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Function? onActionNotification;
  final bool notification;
  final bool back;
  final bool center;
  final Widget? child;

  const CustomAppBar({
    this.title,
    this.onActionNotification,
    this.child,
    this.back = true,
    this.center = false,
    this.notification = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(color: white),
            backwardsCompatibility: false,
            centerTitle: center,
            automaticallyImplyLeading: back,
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: mainColor,
            title: Text(
              title ?? '',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: child ?? SizedBox(),
        ),
      ),
    );
  }
}
