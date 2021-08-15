import 'package:connectivity/connectivity.dart';
import 'package:si_jaja/src/app/app.locator.dart';
import 'package:si_jaja/src/enum/snackbar_type.dart';
import 'package:si_jaja/src/ui/shared/strings.dart';
import 'package:stacked_services/stacked_services.dart';

class ConnectionHelper {
  static ConnectivityResult? _connectivityResult;

  static Future _connect() async {
    _connectivityResult = await Connectivity().checkConnectivity();
  }

  static Future<bool> hasConnection() async {
    await _connect();
    if (_connectivityResult == ConnectivityResult.mobile) return true;
    if (_connectivityResult == ConnectivityResult.wifi) return true;
    return false;
  }

  static Stream<ConnectivityResult> connectionListener() {
    return Connectivity().onConnectivityChanged;
  }

  static showNotConnectionSnackBar() {
    final _snackBarService = locator<SnackbarService>();
    _snackBarService.showCustomSnackBar(
      variant: SnackBarType.Error,
      message: Strings.errorNotConnectionDesc,
      title: Strings.errorNotConnection,
      duration: Duration(seconds: 2),
    );
  }
}
