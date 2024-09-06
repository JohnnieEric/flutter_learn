import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/templeblock/imageoption/bean/image_option.dart';
import 'package:flutter_learn_demo/templeblock/imageoption/image_option_item.dart';


class ImageOptionPanel extends StatelessWidget {
  final List<ImageOption> imageOptions;
  final ValueChanged<int> onSelect;
  final int selectedIndex;

  const ImageOptionPanel({super.key,
    required this.imageOptions,
    required this.selectedIndex,
    required this.onSelect});

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold);
    const EdgeInsets padding = EdgeInsets.symmetric(
        horizontal: 8.0, vertical: 16);
    return Material(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              child: const Text('选择木鱼', style: labelStyle,),
            ),
            Expanded(
                child: Padding(
                  padding: padding,
                  child: Row(
                    children: [
                      Expanded(child: _buildByIndex(0)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildByIndex(1)),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildByIndex(int index) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: ImageOptionItem(
        imageOption:imageOptions[index],
        isSelected : isSelected
      ),
    );
  }
}
