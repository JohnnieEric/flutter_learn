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

  final List<MenuData> menus = const [
    MenuData(label: '猜数字', icon: Icons.question_mark),
    MenuData(label: '电子木鱼', icon: Icons.my_library_music_outlined),
    MenuData(label: '白板绘制', icon: Icons.palette_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(currentIndex),
      bottomNavigationBar: AppBottomBar(
          currentIndex: currentIndex, menus: menus, onItemSelect: _selectItem),
    );
  }

  void _selectItem(int index) {
    if (index == currentIndex) {
      return;
    }
    setState(() {
      currentIndex = index;
    });
  }

  Widget _buildContext(int index) {
    switch (index) {
      case 0:
        return const GuessPage(title: '猜数字');
      case 1:
        return const TempleBlockPage();
      case 2:
        return const DrawingPage();
      default:
        /***
       * 创建一个宽度和高度都为 0 的 SizedBox。其实就是一个占用控件无限小的 Widget 占位符。
       */
        return const SizedBox.shrink();
    }
  }
}
