import 'package:flutter/material.dart';

class AnimatedBlocBodyBuilder extends StatelessWidget {
  const AnimatedBlocBodyBuilder({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
      ) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
