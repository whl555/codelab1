import 'package:codelab1/utils/adpatation.dart';
import 'package:codelab1/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EyeCareWidget extends StatefulWidget {
  const EyeCareWidget({Key? key}) : super(key: key);

  @override
  State<EyeCareWidget> createState() => _EyeCareWidgetState();
}

class _EyeCareWidgetState extends State<EyeCareWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PPScreenAdaptation.isTablet
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 20.px),
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: PPScreenAdaptation.isLandscape ? 708.px : null,
        child: ListView(
          primary: false,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 20.px),
          children: [
            SizedBox(height: 16.px),
            _DistancePostureWidget(),
            SizedBox(height: 16.px),
            _DistancePostureWidget(),
            SizedBox(height: 16.px),
            _DistancePostureWidget(),
          ],
        ),
      ),
    );
  }
}

class _DistancePostureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _EyeCareCard(
        child: Column(
      children: [
        _distanceWidget(context),
        SizedBox(height: 14.px),
        Divider(color: getColor('cd1'), height: 0.5.px),
        SizedBox(height: 16.px),
        _postureWidget(context),
      ],
    ));
  }

  Widget _distanceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EyeCareTitle(
          title: '视距提醒',
          onChanged: (value) {
          },
          value: true,
        ),
        SizedBox(height: 6.px),
        Text(
          '开启后，将在阅读过程中进行提醒',
          style: getTextStyle('b3').textColor('ct3'),
        ),
      ],
    );
  }

  Widget _postureWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EyeCareTitle(
          title: '坐姿矫正',
          onChanged: (value) {},
          value: false,
        ),
        SizedBox(height: 6.px),
        Text(
          '开启后，检测到孩子不良坐姿时进行提醒',
          style: getTextStyle('b3').textColor('ct3'),
        ),
      ],
    );
  }
}

class _EyeCareCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const _EyeCareCard({Key? key, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.all(16.px).add(EdgeInsets.only(bottom: 4.px)),
      decoration: BoxDecoration(
        color: getColor('cb1'),
        borderRadius: BorderRadius.circular(16.px),
      ),
      child: child,
    );
  }
}

class _EyeCareTitle extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const _EyeCareTitle({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getTextStyle('h4').textColor('ct1'),
        ),
        CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: getColor('ca7_right'),
          trackColor: getColor('cd2'),
          thumbColor: getColor('cb1'),
        ),
      ],
    );
  }
}
