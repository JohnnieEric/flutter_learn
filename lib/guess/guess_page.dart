import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/guess/result_notice.dart';
import 'package:flutter_learn_demo/sp_manager.dart';
import 'guess_app_bar.dart';

class GuessPage extends StatefulWidget {
  final String title;

  const GuessPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _GuessPageState();
  }
}

class _GuessPageState extends State<GuessPage>
    with AutomaticKeepAliveClientMixin {
  int _value = 0;
  final Random _random = Random();
  bool _guessing = false;
  bool? _isBig;
  final TextEditingController _guessCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSpConfig();
  }

  void _initSpConfig() async {
    Map<String, dynamic> map = await SpManager.instance.readGuess();
    _guessing = map['guessing'] ?? false;
    _value = map['value'] ?? 0;
    setState(() {});
  }

  void _generateRandomValue() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _guessing = true;
      _value = _random.nextInt(100);
      SpManager.instance.saveGuess(guessing: true, value: _value);
    });
  }

  void _onCheck() {
    if (kDebugMode) {
      print("=====Check:目标数值:$_value=====${_guessCtrl.text}============");
    }
    int? guessNum = int.tryParse(_guessCtrl.text);
    if (guessNum == null || !_guessing) {
      return;
    }
    if (guessNum == _value) {
      setState(() {
        _isBig = null;
        _guessing = false;
      });
      return;
    }

    setState(() {
      _isBig = guessNum > _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: GuessAppBar(
        onCheck: _onCheck,
        controller: _guessCtrl,
      ),
      body: Stack(
        children: [
          if (_isBig != null)
            Column(
              children: [
                if (_isBig!) const ResultNotice(Colors.redAccent, '大了'),
                const Spacer(),
                if (!_isBig!) const ResultNotice(Colors.blueAccent, '小了'),
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
                  _guessing ? '**' : '$_value',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _guessing ? null : _generateRandomValue,
        backgroundColor: _guessing ? Colors.grey : Colors.blue,
        tooltip: 'Increment',
        child: const Icon(Icons.generating_tokens_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _guessCtrl.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
