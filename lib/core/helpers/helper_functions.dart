import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import '../../presentation/widgets/custom_loading.dart';
import '../utils/enums.dart';

class HelperFunctions {
  const HelperFunctions._();

  static unFocusKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  static showToastMessage(
    BuildContext context,
    String message, {
    int duration = 2,
  }) {
    ToastContext().init(context);
    Toast.show(
      message,
      textStyle: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
      ),
      duration: duration,
      gravity: Toast.bottom,
    );
  }

  static Future<T?> showAppDialog<T>(
    BuildContext context, {
    required Widget child,
    Color? bgColor,
    bool barrierDismissible = false,
  }) async {
    return await showDialog(
      context: context,
      barrierColor: bgColor ?? Colors.black54,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return barrierDismissible;
          },
          child: child,
        );
      },
    );
  }

  static submitActions(
    BuildContext context, {
    required RequestState requestState,
    required Function() onLoaded,
    required Function() onError,
  }) {
    switch (requestState) {
      case RequestState.loading:
        unFocusKeyboard(context);
        showAppDialog(
          context,
          child: const SubmitLoading(),
        );
        break;
      case RequestState.loaded:
        onLoaded();
        break;
      case RequestState.error:
        onError();
        break;
      case RequestState.none:
        break;
    }
  }

  static bool get isKeyboardOpened =>
      WidgetsBinding.instance.window.viewInsets.bottom > 0;

  static String convertSecondsToHMS(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds - h * 3600) ~/ 60;
    final s = seconds - (h * 3600) - (m * 60);
    return '${h >= 10 ? h : '0$h'}:${m >= 10 ? m : '0$m'}:${s >= 10 ? s : '0$s'}';
  }
}
