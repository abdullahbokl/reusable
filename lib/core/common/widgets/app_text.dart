import 'package:flutter/material.dart';

import '../../../../core/common/widgets/app_loader.dart';
import '../../utils/app_dimensions.dart';

class AppText extends StatelessWidget {
  const AppText(
    String this.text, {
    super.key,
    this.translation = true,
    this.scrollText = false,
    this.isAutoScale = false,
    this.textSpan,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.isLoading = false,
  });

  final bool translation;
  final String? text;
  final InlineSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;
  final bool scrollText;
  final bool isAutoScale;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const AppLoader();
    }

    return Text(
      translation ? text! : text!,
      style: _style(),
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaler: TextScaler.linear(textScaleFactor ?? 1.0),
    );
  }

  TextStyle _style() {
    if (style != null) return style!;

    return TextStyle(
      fontSize: AppDimensions.scaleFontSize(16),
      fontWeight: FontWeight.normal,
      color: Colors.black,
      overflow: TextOverflow.ellipsis,
    );
  }
}
