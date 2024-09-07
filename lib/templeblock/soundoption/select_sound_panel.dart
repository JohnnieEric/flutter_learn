import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import 'bean/sound_option.dart';

class SoundOptionPanel extends StatelessWidget {
  final List<SoundOption> soundOptions;
  final ValueChanged<int> onSelect;
  final int selectedIndex;

  const SoundOptionPanel({
    super.key,
    required this.soundOptions,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return Material(
      /***
       * SizeBox用来限制子控件的大小，可以设置子控件的间距
       */
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              child: const Text(
                '选择音效',
                style: labelStyle,
              ),
            ),
            /***
             * 生成数据列表
             * List<int>.generate(10,(i) => i + 1)从1到10的数字
             */
            ...List.generate(
                soundOptions.length, (index) => _buildByIndex(index))
          ],
        ),
      ),
    );
  }

  Widget _buildByIndex(int index) {
    bool isSelected = index == selectedIndex;
    TextStyle textStyle =
        TextStyle(color: isSelected ? Colors.blue : Colors.black);
    /***
     * 通常用于填充ListView
     */
    return ListTile(
      selected: isSelected,
      onTap: () => onSelect(index),
      title: Text(soundOptions[index].soundName, style: textStyle),
      trailing: IconButton(
        splashRadius: 20,
        onPressed: () => _tempPlay(soundOptions[index].soundResource),
        icon: const Icon(
          Icons.record_voice_over_rounded,
          color: Colors.blue,
        ),
      ),
    );
  }

  void _tempPlay(String src) async {
    AudioPool pool = await FlameAudio.createPool(src, maxPlayers: 1);
    pool.start();
  }
}
