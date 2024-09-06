import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/templeblock/imageoption/bean/image_option.dart';

class ImageOptionItem extends StatelessWidget {
  final ImageOption imageOption;
  final bool isSelected;

  const ImageOptionItem(
      {required this.imageOption, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    /***
     * Border可以分别构造四条边
     * Border.fromBorderSide和Border.all可以构造所有边相同的边框
     * Border.symmetric可以分别构造垂直和水平对称的边框
     */
    Border border = const Border.fromBorderSide(BorderSide(color: Colors.blue));
    return Container(
        /***
       * EdgeInsets.symmetric指定垂直或水平方向的边距
       * EdgeInsets.all 指定所有边距
       * EdgeInsets.only 指定某一边距
       * EdgeInsets.fromLTRB 分别指定每一个边距
       */
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          /***
           *  BorderRadius.circular 指定所有圆角大小
           *  BorderRadius.vertical 指定上下圆角大小
           *  BorderRadius.horizontal 指定左右圆角大小
           *  BorderRadius.only 指定某一圆角大小
           */
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? border : null,
        ),
        child: Column(
          children: [
            Text(
              imageOption.imageName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(imageOption.imageResource),
              ),
            ),
            Text(
              '每次功德 +${imageOption.min}~${imageOption.max}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ));
  }
}
