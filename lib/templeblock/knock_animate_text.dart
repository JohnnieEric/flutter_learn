import 'package:flutter/material.dart';

class KnockAnimateText extends StatefulWidget {
  final String text;

  const KnockAnimateText({super.key, required this.text});

  @override
  State<StatefulWidget> createState() {
    return _KnockAnimateTextState();
  }
}

class _KnockAnimateTextState extends State<KnockAnimateText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> translateAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(controller);
    scaleAnimation = Tween(begin: 1.0, end: 0.9).animate(controller);
    translateAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(controller);
    controller.forward();
  }

  @override
  void didUpdateWidget(covariant KnockAnimateText oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.forward(from: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: SlideTransition(
        position: translateAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: Text(widget.text),
        ),
      ),
    );
  }
}
