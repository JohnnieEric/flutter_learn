import 'package:flutter/material.dart';

class ConformDialog extends StatelessWidget {
  final String title;
  final String msg;
  final VoidCallback? onConform;
  final VoidCallback? onCancel;

  const ConformDialog(
      {required this.title,
      required this.msg,
      this.onConform,
      this.onCancel,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: _buildTitle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              msg,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildBottom()
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text.rich(TextSpan(
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          const WidgetSpan(
              child: Icon(Icons.warning_amber_outlined,
                  color: Colors.orangeAccent)),
          TextSpan(
              text: title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ]));
  }

  Widget _buildBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton('取消', Colors.white, Colors.grey, onCancel),
        const SizedBox(width: 20),
        _buildButton('确定', Colors.red, Colors.white, onConform),
      ],
    );
  }

  Widget _buildButton(String content, Color backgroundColor,
      Color buttonTextColor, VoidCallback? callback) {
    TextStyle buttonTextStyle = TextStyle(color: buttonTextColor);
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0), color: backgroundColor),
      child: TextButton(
        onPressed: callback,
        child: Text(
          content,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
