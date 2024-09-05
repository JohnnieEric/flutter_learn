import 'package:flutter/material.dart';

class TempleBlockImage extends StatelessWidget {
  const TempleBlockImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/temple_block.png',
        height: 200,
      ),
    );
  }
}
