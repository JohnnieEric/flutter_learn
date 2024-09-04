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

class _ResultNoticeState extends State<ResultNotice>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  /// 状态类初始化，触发一次
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    controller.forward();
  }

  ///状态销毁的时机，触发一次
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  ///多次触发
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: widget.color,
        child: AnimatedBuilder(
            animation: controller,
            builder: (_, child) => Text(widget.info,
                style: TextStyle(
                    fontSize: 54 * (controller.value),
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ResultNotice oldWidget) {
    controller.forward(from: 0);
    super.didUpdateWidget(oldWidget);
  }
}
