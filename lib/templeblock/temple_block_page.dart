import 'package:flutter/material.dart';

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
          Expanded(child: _buildTopContent()),
          Expanded(child: _buildIMage()),
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

  Widget _buildTopContent() {
    ButtonStyle elevateButtonStyle = ElevatedButton.styleFrom(

        ///最小尺寸
        minimumSize: const Size(36, 36),

        ///内边距
        padding: EdgeInsets.zero,
        backgroundColor: Colors.green,

        ///阴影深度
        elevation: 0);

    return Stack(
      children: [
        const Center(
          child: Text(
            "功德数：0",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            /***
           * Wrap相比Column可以设置边距
           */
            right: 10,
            top: 10,
            child: Wrap(
              spacing: 8,
              direction: Axis.vertical,
              children: [
                ElevatedButton(
                  ///当外部的Stack前面有const，此处会报Invalid constant value.
                  ///原因为const关键字用于创建编译时常量，永远不会重建，内部参数不能为变量，此处已包含变量，外部const要删去
                  style: elevateButtonStyle,
                  onPressed: () {},
                  child: const Icon(Icons.music_note_outlined),
                ),
                ElevatedButton(
                  style: elevateButtonStyle,
                  onPressed: () {},
                  child: const Icon(Icons.image),
                )
              ],
            ))
      ],
    );
  }

  Widget _buildIMage() {
    return Center(
      child: Image.asset(
        'assets/images/temple_block.png',
        height: 200,
      ),
    );
  }

  ///去历史页面
  void _toHistory() {}
}
