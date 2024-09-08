import 'package:flutter/material.dart';

class StrokeWidthSelector extends StatelessWidget {
  final Color color;
  final List<double> supportStrokeWidths;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const StrokeWidthSelector({
    super.key,
    required this.color,
    required this.supportStrokeWidths,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
            supportStrokeWidths.length, (index) => _buildByIndex(index)),
      ),
    );
  }

  Widget _buildByIndex(int index) {
    bool selected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 70,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: selected ? Border.all(color: Colors.blue) : null),
        child: Container(
          width: 50,
          color: color,
          height: supportStrokeWidths[index],
        ),
      ),
    );
  }
}
