import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/app_bottom_bar.dart';
import 'package:flutter_learn_demo/guess/guess_page.dart';
import 'package:flutter_learn_demo/templeblock/temple_block_page.dart';

import 'drawing/drawing_page.dart';
import 'menu_data.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppNavigationState();
  }
}

class _AppNavigationState extends State<AppNavigation> {
  int currentIndex = 0;

  final PageController controller = PageController();

  final List<MenuData> menus = const [
    MenuData(label: '猜数字', icon: Icons.question_mark),
    MenuData(label: '电子木鱼', icon: Icons.my_library_music_outlined),
    MenuData(label: '白板绘制', icon: Icons.palette_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      bottomNavigationBar: AppBottomBar(
          currentIndex: currentIndex, menus: menus, onItemSelect: _selectItem),
    );
  }

  void _selectItem(int index) {
    if (index == currentIndex) {
      return;
    }
    controller.jumpToPage(index);
    setState(() {
      currentIndex = index;
    });
  }

  Widget _buildContent() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        GuessPage(title: '猜数字'),
        TempleBlockPage(),
        DrawingPage()
      ],
    );
  }
}
