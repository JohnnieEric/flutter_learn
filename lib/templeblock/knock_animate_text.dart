import 'package:flutter/material.dart';

class KnockAnimateText extends StatefulWidget {
  final String text;
  final AnimationController controller;

  const KnockAnimateText({super.key, required this.text, required this.controller});

  @override
  State<StatefulWidget> createState() {
    return _KnockAnimateTextState();
  }
}

class _KnockAnimateTextState extends State<KnockAnimateText>
    with SingleTickerProviderStateMixin {
  
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> translateAnimation;
  
  @override
  void initState() {
    super.initState();
    fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(widget.controller);
    scaleAnimation = Tween(begin: 1.0, end: 0.9).animate(widget.controller);
    translateAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(widget.controller);
    widget.controller.forward();
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
