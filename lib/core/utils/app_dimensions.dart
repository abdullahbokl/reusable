import 'package:flutter/material.dart';

import 'app_navigator.dart';
import 'size_config.dart';

abstract class AppDimensions {
  static currentWidth() {
    return MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).width;
  }

  static currentHeight() {
    return MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).height;
  }

  static double scaleHeight(double height) {
    double scaleFactor = getScaleFactor();
    return height * scaleFactor;
  }

  static double scaleWidth(double width) {
    double scaleFactor = getScaleFactor();
    return width * scaleFactor;
  }

  static double scaleFontSize(double fontSize) {
    double scaleFactor = getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * .9;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double scaleImageSize(double imageSize) {
    double scaleFactor = getScaleFactor();
    double minSize = imageSize * .8;
    double maxSize = imageSize * 1.0;
    return (imageSize * scaleFactor).clamp(minSize, maxSize);
  }

  static double scaleIconSize(double iconSize) {
    double scaleFactor = getScaleFactor();
    return iconSize * scaleFactor;
  }

  static int scaleGridCount() {
    double width =
        MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).width;
    if (width < SizeConfig.mobile) {
      return 2;
    } else if (width < SizeConfig.tablet) {
      return 3;
    } else {
      return 4;
    }
  }

  static double getScaleFactor() {
    double width =
        MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).width;
    if (width < SizeConfig.mobile) {
      return width / 480;
    } else if (width < SizeConfig.tablet) {
      return width / 768;
    } else {
      return width / 1024;
    }
  }
}
