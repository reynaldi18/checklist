import 'package:fluttertoast/fluttertoast.dart';
import 'package:si_jaja/src/ui/shared/styles.dart';

class CustomToast {
  static void show(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: black,
    textColor: white,
    fontSize: 12
  );

  static void cancelAll() => Fluttertoast.cancel();
}