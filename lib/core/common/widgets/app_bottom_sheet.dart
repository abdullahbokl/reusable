import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_navigator.dart';

class AppBottomSheet<T> extends StatelessWidget {
  const AppBottomSheet._({
    super.key,
    required this.child,
    required this.showCloseIcon,
  });

  final Widget child;
  final bool showCloseIcon;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool enableDrag = true,
    bool isDismissible = true,
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
    bool showCloseIcon = true,
    Function(T?)? onResult,
    Function(dynamic)? onError,
    VoidCallback? onComplete,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      barrierColor: barrierColor,
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: const Radius.circular(20).r),
      ),
      builder: (_) {
        return AppBottomSheet._(showCloseIcon: showCloseIcon, child: child);
      },
    )
      ..then(onResult ?? (_) {})
      ..catchError(onError ?? (_) {})
      ..whenComplete(onComplete ?? () {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 300),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: showCloseIcon
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  if (showCloseIcon)
                    InkWell(
                      onTap: () => AppNavigator.pop(),
                      child: const Icon(Icons.close, color: Colors.grey),
                    ),
                  Container(
                    width: 90.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(90).r,
                    ),
                  ),
                  if (showCloseIcon) const SizedBox.shrink(),
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
