import 'package:easy_debounce/easy_debounce.dart';

abstract class AppConstants {
  // static const int snackbarDuration = 2;
  // static void showSnakeBar(
  //   String message, {
  //   ToastColorsEnum color = ToastColorsEnum.normal,
  // }) {
  //   final FToast fToast = FToast()
  //     ..init(AppNavigator.navigatorKey.currentContext!);
  //   fToast.showToast(
  //     child: CustomToastBody(message: message, color: color),
  //     gravity: ToastGravity.SNACKBAR,
  //     toastDuration: Duration(seconds: snackbarDuration),
  //   );
  // }

  static void debounceFunction(
    Function() action, {
    required String tag,
    Duration? duration,
  }) {
    EasyDebounce.debounce(
      tag,
      duration ?? const Duration(milliseconds: 500),
      action,
    );
  }
}
