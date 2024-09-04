import 'package:flutter/material.dart';

class ResultNotice extends StatefulWidget {
  final Color color;
  final String info;

  const ResultNotice(this.color, this.info, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ResultNoticeState();
  }
}

class _ResultNoticeState extends State<ResultNotice> with SingleTickerProviderStateMixin{
  
  late AnimationController controller;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            alignment: Alignment.center,
            color: widget.color,
            child: Text(widget.info,
                style: const TextStyle(
                    fontSize: 54,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))));
  }
  
}


