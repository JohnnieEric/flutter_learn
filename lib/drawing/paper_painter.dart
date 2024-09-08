import 'dart:ui';

import 'package:flutter/material.dart';

import 'bean/line.dart';

class PaperPainter extends CustomPainter {
  late Paint _paint;
  final List<Line> lines;

  PaperPainter({required this.lines}) {
    _paint = Paint();
    _paint.style = PaintingStyle.stroke;
    _paint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < lines.length; i++) {
      _drawLine(canvas, lines[i]);
    }
  }

  void _drawLine(Canvas canvas, Line line) {
    _paint.color = line.color;
    _paint.strokeWidth = line.strokeWidth;
    /***
     * PointMode.points绘制单独的点
     * PointMode.lines将点分为若干对，每对练成线
     * PointMode.polygon将点都连成线
     */
    canvas.drawPoints(PointMode.polygon, line.points, _paint);
  }

  ///是否有必要重绘，如果外部状态不会改变我们，则返回false
  ///当前为手绘板，外部手指移动会影响我们绘制，所以应该返回true重绘
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
