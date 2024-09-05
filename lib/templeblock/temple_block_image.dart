import 'package:flutter/material.dart';

class TempleBlockImage extends StatelessWidget {
  final VoidCallback onTap;

  const TempleBlockImage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/images/temple_block.png',
        height: 200,
        width: 200,
      ),
    ));
  }
}
