import 'package:flutter/material.dart';

class StrokeColorSelector extends StatelessWidget {
  final List<Color> supportColors;
  final int selectedColorIndex;
  final ValueChanged<int> onSelect;

  const StrokeColorSelector(
      {required this.supportColors,
      required this.selectedColorIndex,
      required this.onSelect,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        /***
         * Row和Column如果子widget超过屏幕范围会报溢出错误
         * 这个时候应该用Wrap和Flow来支持流式布局
         */
        child: Wrap(
          children: List.generate(
              supportColors.length, (index) => _buildByIndex(index)),
        ));
  }

  Widget _buildByIndex(int index) {
    bool selected = index == selectedColorIndex;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.all(2),
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: selected ? Border.all(color: Colors.blue) : null),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: supportColors[index]),
        ),
      ),
    );
  }
}
