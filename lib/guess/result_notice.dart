import 'package:flutter/material.dart';

class ResultNotice extends StatelessWidget {
  final Color color;
  final String info;

  const ResultNotice(this.color, this.info, {super.key});

  Expanded _buildResultNotice() {
    return Expanded(
        child: Container(
            // alignment: Alignment.center,
            color: color,
            child: Text(info,
                style: const TextStyle(
                    fontSize: 54,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))));
  }

  @override
  Widget build(BuildContext context) {
    return _buildResultNotice();
  }
}
