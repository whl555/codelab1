import 'package:codelab1/utils/adpatation.dart';
import 'package:codelab1/utils/theme.dart';
import 'package:flutter/material.dart';

class PPTabBar extends StatelessWidget {
  final int selectIndex;
  final Function(int) switchTab;

  const PPTabBar({
    Key? key,
    required this.selectIndex,
    required this.switchTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.px,
      width: 204.px,
      padding: EdgeInsets.all(4.px),
      decoration: BoxDecoration(
        color: getColor('cb1'),
        borderRadius: BorderRadius.circular(20.px),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12.px,
            offset: Offset(0, 2.px),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildTabItem('tab1', 0),
          _buildTabItem('tab0', 1),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final isSelected = selectIndex == index;
    return GestureDetector(
      onTap: () => switchTab(index),
      child: Container(
        width: 98.px,
        height: 32.px,
        decoration: BoxDecoration(
          color: isSelected ? getColor('cm1') : Colors.transparent,
          borderRadius: BorderRadius.circular(16.px),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 2.px),
        child: Text(
          title,
          style: getTextStyle('h4').textColor(isSelected ? 'ct5' : 'ct1'),
        ),
      ),
    );
  }
}