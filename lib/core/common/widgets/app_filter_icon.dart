import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_bottom_sheet.dart';

class AppFilterIcon<T> extends StatelessWidget {
  const AppFilterIcon({
    super.key,
    required this.child,
    this.onResult,
    this.onError,
    this.onComplete,
    this.enableDrag = true,
    this.isDismissible = true,
    this.isScrollControlled = true,
    this.backgroundColor,
    this.barrierColor,
    this.showCloseIcon = true,
  });

  final Widget child;
  final Function(T?)? onResult;
  final Function(dynamic)? onError;
  final VoidCallback? onComplete;
  final bool enableDrag;
  final bool isDismissible;
  final bool isScrollControlled;
  final Color? backgroundColor;
  final Color? barrierColor;
  final bool showCloseIcon;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Filter",
      child: InkWell(
        onTap: () {
          AppBottomSheet.show<T>(
            context: context,
            child: child,
            onResult: onResult,
            onError: onError,
            onComplete: onComplete,
            enableDrag: enableDrag,
            isDismissible: isDismissible,
            isScrollControlled: isScrollControlled,
            backgroundColor: backgroundColor,
          );
        },
        borderRadius: BorderRadius.circular(10).r,
        child: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Icon(
            Icons.filter_alt_rounded,
            color: Colors.grey.shade600,
            size: 30.r,
          ),
        ),
      ),
    );
  }
}
