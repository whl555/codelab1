import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PPUiUtils {
  /// 判断设备是不是平板
  static isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 560;
  }

  /// 判断设备是不是横屏
  static isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// 判断TextView中的文本会不会overflow
  static bool hasTextOverflow(
      String text,
      TextStyle style, {
        double minWidth = 0,
        double maxWidth = double.infinity,
        int maxLines = 1,
      }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  /// 获取界面内容的最大展示宽度，只有平板设备横屏时才会有这个限制
  static double pageContentMaxWidth(BuildContext context) {
    if (isTablet(context) && isLandscape(context)) {
      return MediaQuery.of(context).size.shortestSide;
    }
    return double.infinity;
  }

  /// 获取内容的额外距离屏幕的边距
  static double pageContentMargin(BuildContext context) {
    double maxWidth = pageContentMaxWidth(context);
    double screenWidth = MediaQuery.of(context).size.width;
    if (maxWidth < screenWidth) {
      return (screenWidth - maxWidth) / 2;
    }

    return 0;
  }

  static double getAdapt(BuildContext context,
      {required double phoneValue,
        required double padLandscapeValue,
        double? padPortraitValue}) {
    var isPad = false;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      isPad = true;
    } else {
      isPad = PPUiUtils.isTablet(context);
    }
    if (isLandscape(context)) {
      return padLandscapeValue; //平板横屏尺寸
    } else if (isPad) {
      return padPortraitValue ?? phoneValue; //Android平板竖屏尺寸
    }
    return phoneValue; //手机尺寸
  }
}
