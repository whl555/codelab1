import 'package:codelab1/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// 处理屏幕适配的相关逻辑
class PPScreenAdaptation {
  /// 设备是否是平板
  static bool isTablet = false;

  /// 如果是平板，对于尺寸的缩放系数
  static double tabletScale = preferredTabletScale;

  /// 当前是否是横屏
  static bool isLandscape = false;

  /// 是否已经输出过日志，为了防止日志反复输出
  static bool _hasLogPrint = false;

  /// 记录上一次初始化时候的屏幕方向
  static Orientation? _lastOrientation = null;

  /// 默认的平板缩放系数，和UI确定的
  static const double preferredTabletScale = 0.8;

  /// 是否根据屏幕的宽度进行适配
  static bool isBaseOnWidth = preferredBaseOnWidth;

  /// 默认的根据宽高适配的参数，默认是根据宽度适配
  static bool preferredBaseOnWidth = true;

  /// 读取屏幕数据，需要在runApp()方法之前调用
  static ensureScreenSize() async {
    await ScreenUtil.ensureScreenSize();
  }

  /// 在页面初始化的时候调用
  static init(BuildContext context, {bool? setTablet}) {
    ScreenUtil.init(
      context,
      designSize: MediaQuery.of(context).orientation == Orientation.portrait
          ? Size(375, 812)
          : Size(812, 375),
    );

    // 如果屏幕方向切换了，则重新输出一次日志
    if (_lastOrientation != MediaQuery.of(context).orientation) {
      _hasLogPrint = false;
    }
    _lastOrientation = MediaQuery.of(context).orientation;

    isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    isTablet = setTablet ?? PPUiUtils.isTablet(context);

    if (!_hasLogPrint) {
      debugPrint("设备宽度: ${ScreenUtil().screenWidth}dp");
      debugPrint("设备高度: ${ScreenUtil().screenHeight}dp");
      debugPrint("设备像素密度: ${ScreenUtil().pixelRatio}");
      debugPrint(
          "设备宽高比: ${ScreenUtil().screenWidth / ScreenUtil().screenHeight}");
      debugPrint("设备是否是平板: ${isTablet}");
      debugPrint("1个距离单位(适配宽度): ${ScreenUtil().setWidth(1)}");
      debugPrint("1个距离单位(适配高度): ${ScreenUtil().setHeight(1)}");
      debugPrint("1个距离单位(最终使用): ${getPx(1)}");
      debugPrint("1个字体单位: ${ScreenUtil().setSp(1)}");
      debugPrint("1个字体单位(最终使用): ${getSp(1)}");
      _hasLogPrint = true;
    }
  }

  /// 获取根据设计稿的尺寸和当前设备尺寸换算过的1个单位的距离的大小，
  /// 如果设备是平板，会对计算出来的结果再进行一次调整。
  static double getPx(num size) {
    // 是根据屏幕高度还是屏幕宽度来尽心适配
    var transformedSize = isBaseOnWidth
        ? ScreenUtil().setWidth(size)
        : ScreenUtil().setHeight(size);

    // 针对平板进行调整
    if (PPScreenAdaptation.isTablet) {
      transformedSize = transformedSize * PPScreenAdaptation.tabletScale;
    }

    return transformedSize;
  }

  static double getSp(num size) {
    return PPScreenAdaptation.isTablet
        ? ScreenUtil().setSp(size) * PPScreenAdaptation.tabletScale
        : ScreenUtil().setSp(size);
  }
}

extension PPScreenAdaptationExtension on num {
  double get px => PPScreenAdaptation.getPx(this);

  double get sp => PPScreenAdaptation.getPx(this);
}
