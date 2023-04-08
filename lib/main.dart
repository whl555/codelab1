import 'package:codelab1/utils/adpatation.dart';
import 'package:codelab1/utils/theme.dart';
import 'package:codelab1/widgets/eye_care_widget.dart';
import 'package:codelab1/widgets/pp_tabbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: RenderBoxExamplePage()));

}

class RenderBoxExamplePage extends StatefulWidget {
  const RenderBoxExamplePage({Key? key}) : super(key: key);

  @override
  State<RenderBoxExamplePage> createState() => _RenderBoxExamplePageState();
}

class _RenderBoxExamplePageState extends State<RenderBoxExamplePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    PPScreenAdaptation.init(context);
    return Scaffold(
      appBar: AppBar(title: const Text("codelab1"),),
      body: SafeArea(
        child: Container(
            color: getColor('cb2'),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                    height: 68.px,
                    padding: EdgeInsets.only(top: 16.px),
                    alignment: Alignment.topCenter,
                    child: PPTabBar(
                      selectIndex: _tabIndex,
                      switchTab: (index) {
                        _tabController.animateTo(index);
                        setState(() {
                          _tabIndex = index;
                        });
                      },
                    )
                ),
                Flexible(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      EyeCareWidget(),
                      EyeCareWidget(),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}




