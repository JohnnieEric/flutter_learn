import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/templeblock/count_panel.dart';
import 'package:flutter_learn_demo/templeblock/knock_animate_text.dart';
import 'package:flutter_learn_demo/templeblock/temple_block_image.dart';
import 'package:flame_audio/flame_audio.dart';

class TempleBlockPage extends StatefulWidget {
  const TempleBlockPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TempleBlockPageState();
  }
}

class _TempleBlockPageState extends State<TempleBlockPage> {
  int _counter = 0;
  int _addCounter = 0;
  final Random random = Random();
  AudioPool? pool;
  
  @override
  void initState() {
    super.initState();
    _initAudioPool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
              child: CountPanel(
                  count: _counter,
                  onTapSwitchAudio: () {},
                  onTapSwitchImage: () {})),
          Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
            children: [
              TempleBlockImage(
                onTap: _knockTempleBlock,
              ),
              if (_addCounter != 0) KnockAnimateText(text: '功德+$_addCounter')
            ],
          ))
        ],
      ),
    );
  }
  
  Future<void> _initAudioPool() async {
    pool = await FlameAudio.createPool(
      /***
       * flame_audio 资源位置默认为asserts/audio中
       */
      'temple_block_1.mp3',
      minPlayers: 3,
      maxPlayers: 4,
    );
  }

  /// 标题栏
  AppBar _buildAppBar() {
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

  void _knockTempleBlock() {
    pool?.start();
    setState(() {
      _addCounter = 1 + random.nextInt(3);
      _counter += _addCounter;
    });
  }
}
