import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class AppAdaptiveLayout extends StatelessWidget {
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  final WidgetBuilder desktopLayout;

  const AppAdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < SizeConfig.tablet) {
        return mobileLayout(context);
      } else if (constrains.maxWidth < SizeConfig.desktop) {
        return tabletLayout(context);
      } else {
        return desktopLayout(context);
      }
    });
  }
}
