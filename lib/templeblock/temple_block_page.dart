import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/templeblock/count_panel.dart';
import 'package:flutter_learn_demo/templeblock/temple_block_image.dart';

class TempleBlockPage extends StatefulWidget {
  const TempleBlockPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TempleBlockPageState();
  }
}

class _TempleBlockPageState extends State<TempleBlockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
              child: CountPanel(
                  count: 0, onTapSwitchAudio: () {}, onTapSwitchImage: () {})),
          const Expanded(child: TempleBlockImage()),
        ],
      ),
    );
  }

  /// 标题栏
  AppBar buildAppBar() {
    return AppBar(
      /***
       * 标题栏的阴影深度
       */
      elevation: 0,
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      /***
       * 标题栏的图标主题
       */
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text("电子木鱼"),
      /***
       * 标题栏右侧展示的组件列表
       */
      actions: [
        IconButton(onPressed: _toHistory, icon: const Icon(Icons.history))
      ],
    );
  }

  ///去历史页面
  void _toHistory() {}
}
