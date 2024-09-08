import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/drawing/bean/line.dart';
import 'package:flutter_learn_demo/drawing/paper_painter.dart';
import 'package:flutter_learn_demo/drawing/selector/stroke_color_selector.dart';
import 'package:flutter_learn_demo/drawing/selector/stroke_width_selector.dart';

import '../conform_dialog.dart';

// 用户点击清除时，清空线列表。
// 用户可以通过交互选择颜色，更新颜色激活索引。
// 用户可以通过交互选择线宽，更新线宽激活索引
class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DrawingPageState();
  }
}

class _DrawingPageState extends State<DrawingPage> with AutomaticKeepAliveClientMixin{
  final List<Line> _lines = [];
  int selectedStrokeWidthIndex = 0;
  int selectedStrokeColorIndex = 0;

  final List<Color> supportColors = [
    Colors.black,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.brown,
    Colors.pink,
    Colors.cyan,
    Colors.lime,
    Colors.teal
  ];

  final List<double> supportStrokeWidths = [1, 2, 4, 6, 8, 10];

  double get selectedStrokeWidth =>
      supportStrokeWidths[selectedStrokeWidthIndex];

  Color get selectedStrokeColor => supportColors[selectedStrokeColorIndex];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          /**
           * systemOverlayStyle修改状态栏
           */
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          title: const Text('画板绘制'),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: _showClearDialog,
                icon: const Icon(
                  CupertinoIcons.delete,
                  color: Colors.black,
                  size: 20,
                ))
          ],
        ),
        body: Stack(
          children: [
            GestureDetector(
              /***
               * 监听用户开始拖拽
               */
              onPanStart: _onPanStart,
              /**
               * 监听用户拖拽中
               */
              onPanUpdate: _onPanUpdate,
              child: CustomPaint(
                painter: PaperPainter(lines: _lines),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                ),
              ),
            ),
            /*Positioned(
                bottom: 40,
                child: StrokeColorSelector(
                    supportColors: supportColors,
                    selectedColorIndex: selectedStrokeColorIndex,
                    onSelect: _selectStrokeWidthColor)),
            Positioned(
                right: 10,
                bottom: 0,
                child: StrokeWidthSelector(
                    color: selectedStrokeColor,
                    supportStrokeWidths: supportStrokeWidths,
                    selectedIndex: selectedStrokeWidthIndex,
                    onSelect: _selectStrokeWidth))*/
            Positioned(
              bottom: 0,
              /**
               * 获取屏幕宽度
               */
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  /**
                   * Expanded的作用是让子widget填充Row或Column中剩余的空间
                   */
                  Expanded(
                    child: StrokeColorSelector(
                        supportColors: supportColors,
                        selectedColorIndex: selectedStrokeColorIndex,
                        onSelect: _selectStrokeWidthColor),
                  ),
                  StrokeWidthSelector(
                      color: selectedStrokeColor,
                      supportStrokeWidths: supportStrokeWidths,
                      selectedIndex: selectedStrokeWidthIndex,
                      onSelect: _selectStrokeWidth),
                ],
              ),
            ),
          ],
        ));
  }

  void _selectStrokeWidth(int index) {
    if (index == selectedStrokeWidthIndex) {
      return;
    }
    setState(() {
      selectedStrokeWidthIndex = index;
    });
  }

  void _selectStrokeWidthColor(int index) {
    if (index == selectedStrokeColorIndex) {
      return;
    }
    setState(() {
      selectedStrokeColorIndex = index;
    });
  }

  ///用户开始拖拽开始时，需要创建 Line 对象，加入线列表。
  void _onPanStart(DragStartDetails details) {
    _lines.add(Line(
        points: [details.localPosition],
        strokeWidth: selectedStrokeWidth,
        color: selectedStrokeColor));
  }

  // 用户拖拽过程中，将触点添加到线列表最后一条线中。
  void _onPanUpdate(DragUpdateDetails details) {
    Offset point = details.localPosition;
    double distance = (_lines.last.points.last - point).distance;
    if (distance <= 5) {
      return;
    }
    _lines.last.points.add(details.localPosition);
    setState(() {});
  }

  void _showClearDialog() {
    showDialog(
        context: context,
        builder: (context) => ConformDialog(
              title: '清空提示',
              msg: '您的当前操作会清空绘制内容，是否确定删除?',
              onConform: _clear,
              onCancel: () => Navigator.pop(context),
            ));
  }

  void _clear() {
    _lines.clear();
    Navigator.pop(context);
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
