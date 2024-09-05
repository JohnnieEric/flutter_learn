import 'package:flutter/material.dart';

class CountPanel extends StatelessWidget {
  final int count;
  final VoidCallback onTapSwitchAudio;
  final VoidCallback onTapSwitchImage;

  const CountPanel(
      {super.key,
      required this.count,
      required this.onTapSwitchAudio,
      required this.onTapSwitchImage});

  @override
  Widget build(BuildContext context) {
    return _buildTopContent();
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
        Center(
          child: Text(
            "功德数：$count",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  onPressed: onTapSwitchAudio,
                  child: const Icon(Icons.music_note_outlined),
                ),
                ElevatedButton(
                  style: elevateButtonStyle,
                  onPressed: onTapSwitchImage,
                  child: const Icon(Icons.image),
                )
              ],
            ))
      ],
    );
  }
}
