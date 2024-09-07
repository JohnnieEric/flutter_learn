import 'package:flutter/material.dart';

class TempleBlockImage extends StatelessWidget {
  final VoidCallback onTap;
  final String imageResource;

  const TempleBlockImage(
      {super.key, required this.imageResource, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imageResource,
        height: 200,
        width: 200,
      ),
    ));
  }
}
