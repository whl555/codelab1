import 'package:codelab1/utils/adpatation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 获取文字的样式
TextStyle getTextStyle(String name) {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return _androidTextStyle(name);
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    return _iOSTextStyle(name);
  } else {
    return _defaultTextStyle(name);
  }
}

/// 默认的文字样式
TextStyle _defaultTextStyle(String name) {
  switch (name) {
    case 'h1':
      return TextStyle(fontSize: 24.sp, height: 1.5);
    case 'h2':
      return TextStyle(fontSize: 20.sp, height: 1.5);
    case 'h3':
      return TextStyle(fontSize: 18.sp, height: 1.5);
    case 'h4':
      return TextStyle(fontSize: 16.sp, height: 1.5);
    case 'h5':
      return TextStyle(fontSize: 14.sp, height: 1.42);
    case 'b1':
      return TextStyle(fontSize: 16.sp, height: 1.5);
    case 'b2':
      return TextStyle(fontSize: 14.sp, height: 1.42);
    case 'b3':
      return TextStyle(fontSize: 12.sp, height: 1.5);
    case 'a1':
      return TextStyle(fontSize: 11.sp, height: 1.45);
    case 'a2':
      return TextStyle(fontSize: 10.sp, height: 1.4);
    case 'i1':
      return TextStyle(fontSize: 16.sp, height: 1.5);
    case 'i2':
      return TextStyle(fontSize: 14.sp, height: 1.5);
    case 'i3':
      return TextStyle(fontSize: 12.sp, height: 1.5);
    case 'i4':
      return TextStyle(fontSize: 11.sp, height: 1.45);
    case 'i5':
      return TextStyle(fontSize: 10.sp, height: 1.4);
    case "nb1":
      return TextStyle(
        fontSize: 36.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.bold,
      );
    case "nb2":
      return TextStyle(
        fontSize: 30.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.bold,
      );
    case "nb3":
      return TextStyle(
        fontSize: 24.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.bold,
      );
    case "nb4":
      return TextStyle(
        fontSize: 20.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.bold,
      );
    case "nb5":
      return TextStyle(
        fontSize: 16.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.bold,
      );
    case "nb6":
      return TextStyle(
        fontSize: 12.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.bold,
      );
    case "nm1":
      return TextStyle(
        fontSize: 24.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.w500,
      );
    case "nm2":
      return TextStyle(
        fontSize: 20.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.w500,
      );
    case "nm3":
      return TextStyle(
        fontSize: 16.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.w500,
      );
    case "nm4":
      return TextStyle(
        fontSize: 12.sp,
        height: 1.5,
        letterSpacing: -1,
        fontFamily: "Objectivity",
        fontWeight: FontWeight.w500,
      );
    default:
      return TextStyle();
  }
}

/// iOS设备上的文字样式
TextStyle _iOSTextStyle(String name) {
  switch (name) {
    case 'h1':
    case 'h2':
    case 'h3':
    case 'h4':
      return _defaultTextStyle(name).copyWith(
        fontWeight: FontWeight.w600,
        fontFamily: 'PingFangSC-Semibold, PingFang SC',
      );
    case 'h5':
      return _defaultTextStyle(name).copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: 'PingFangSC-Semibold, PingFang SC',
      );
    case 'b1':
    case 'b2':
    case 'b3':
    case 'a1':
    case 'a2':
      return _defaultTextStyle(name).copyWith(
        fontWeight: FontWeight.normal,
      );
    case 'i1':
    case 'i2':
    case 'i3':
    case 'i4':
    case 'i5':
      return _defaultTextStyle(name).copyWith(
        fontWeight: FontWeight.w600,
        fontFamily: 'PingFangSC-Semibold, PingFang SC',
      );
    default:
      return _defaultTextStyle(name);
  }
}

/// 安卓设备上的文字样式
TextStyle _androidTextStyle(String name) {
  switch (name) {
    case 'h1':
    case 'h2':
    case 'h3':
    case 'h4':
      return _defaultTextStyle(name).copyWith(
        fontFamily: 'PingFang_semibold',
      );
    case 'h5':
      return _defaultTextStyle(name).copyWith(
        fontFamily: 'PingFang_medium',
      );
    case 'b1':
    case 'b2':
    case 'b3':
    case 'a1':
    case 'a2':
      return _defaultTextStyle(name).copyWith(
        fontFamily: 'PingFang_regular',
      );
    case 'i1':
    case 'i2':
    case 'i3':
    case 'i4':
    case 'i5':
      return _defaultTextStyle(name).copyWith(
        fontFamily: 'PingFang_semibold',
      );
    default:
      return _defaultTextStyle(name);
  }
}

extension PPTextStyleExtension on TextStyle {
  /// 根据名字设置字体颜色，[name]需要和录入的颜色匹配，
  /// [landscape]为可选参数，如果设备是横屏则会使用这个名字对应的颜色
  TextStyle textColor(String name, {String? landscape}) => copyWith(
    color: getColor(
      (landscape != null && PPScreenAdaptation.isLandscape)
          ? landscape
          : name,
    ),
  );
}

/// 获取颜色名对应的颜色
Color getColor(String name) {
  switch (name) {
    case 'cm1':
      return Color(0xFFFF6047);
    case 'cml1':
      return Color(0xFFFFECEB);
    case 'ca1':
      return Color(0xFFFFA825);
    case 'ca2':
      return Color(0xFFFFD426);
    case 'ca3':
      return Color(0xFF79D64B);
    case 'ca4':
      return Color(0xFF52C5FF);
    case 'ca5':
      return Color(0xFF9F8CFF);
    case 'ca6':
      return Color(0xFFFF8CD9);
    case 'ca7_right':
      return Color(0xFF4BD67A);
    case 'cal1':
      return Color(0xFFFFEFD6);
    case 'cal2':
      return Color(0xFFFFF5CC);
    case 'cal3':
      return Color(0xFFE6FADC);
    case 'cal4':
      return Color(0xFFE5F7FF);
    case 'cal5':
      return Color(0xFFF0EDFF);
    case 'cal5':
      return Color(0xFFF0EDFF);
    case 'cal6':
      return Color(0xFFFFEBF8);
    case 'cmh1':
      return Color(0xFFFFD9DA);
    case 'ct1':
      return Color(0xFF202F42);
    case 'ct2':
      return Color(0xFF3D5066);
    case 'ct3':
      return Color(0xFF62768C);
    case 'ct4':
      return Color(0xFFBAC8D9);
    case 'ct5':
      return Color(0xFFFFFFFFF);
    case 'ct6':
      return Color(0xFF4D9DFF);
    case 'ct7':
      return Color(0xFFFFE4A6);
    case 'cb1':
      return Color(0xFFFFFFFF);
    case 'cb2':
      return Color(0xFFF5F7FC);
    case 'cb3':
      return Color(0xFFF0F5FC);
    case 'cd1':
      return Color(0xFFE1EAF5);
    case 'cd2':
      return Color(0xFFBAC8D9);
    case 'cmr1':
      return Color.fromRGBO(0x0A, 0x11, 0x1A, 0.7);
    case 'cmr2':
      return Color.fromRGBO(0x0A, 0x11, 0x1A, 0.5);
    case 'cmr3':
      return Color.fromRGBO(0x0A, 0x11, 0x1A, 0.3);
  }
  return Colors.black;
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
