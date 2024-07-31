import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCircle;

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.size,
    this.padding = 2,
    this.isExpanded = false,
  });

  final double? size;
  final double padding;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final Widget child = Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: size ?? 35,
          duration: const Duration(milliseconds: 1000),
        ),
      ),
    );
    return isExpanded ? Expanded(child: child) : child;
  }
}
