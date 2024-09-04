import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn_demo/guess/result_notice.dart';

import 'guess_app_bar.dart';

class GuessPage extends StatefulWidget {
  final String title;

  const GuessPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _GuessPageState();
  }
}

class _GuessPageState extends State<GuessPage> {
  int _value = 0;
  final Random _random = Random();
  bool _guessing = false;

  void _generateRandomValue() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _value = _random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: const GuessAppBar(),
      body: Stack(
        children: [
          const Column(
            children: [
              ResultNotice(Colors.redAccent, '大了'),
              ResultNotice(Colors.blueAccent, '小了'),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '点击生成随机数值',
                ),
                Text(
                  '$_value',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomValue,
        tooltip: 'Increment',
        child: const Icon(Icons.generating_tokens_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
