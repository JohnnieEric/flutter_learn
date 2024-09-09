import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String kGuessSpKey = 'guess-config';
const String kTempleBlockSpKey = 'temple-block-config';

class SpManager {
  ///私有化构造函数
  SpManager._();

  static SpManager? _spManager;

  SharedPreferences? _sp;

  ///单例
  static SpManager get instance {
    _spManager = _spManager ?? SpManager._();
    return _spManager!;
  }

  ///async表示函数是异步，定义的函数会返回一个Future对象
  Future<void> initSpWhenNull() async {
    if (_sp != null) return;
    /***
     * 双问号的意思是 如果_sp不为空，返回_sp,如果_sp为空，则初始化_sp
     */
    _sp = _sp ?? await SharedPreferences.getInstance();
  }

  Future<bool> saveGuess({required bool guessing, required int value}) async {
    /**await表示等待异步任务完成后才会继续往下执行，await只能在异步函数内部，await修饰的必须是异步任务
        String _data = '0';

        void main() {
          getData();
          print('4-做其他事');
        }

        void getData() async {
          print('1-开始data=$_data');
        
          await Future(() {
            for (int i = 0; i < 100000000; i++) {
                _data = '网络数据';
            }
            print('2-结束data=$_data');
          });
          print('3-结束data=$_data');
        }
      
        顺序为：
        1-开始data=0
        4-做其他事
        2-结束data=网络数据
        3-结束data=网络数据

        理解：1完成后，await修饰的是一个异步任务，所以4先被执行，同时由于Future被await修饰必须执行完成后才能执行3，所以1423
     */
    await initSpWhenNull();
    String content = json.encode({'guessing': guessing, 'value': value});
    return _sp!.setString(kGuessSpKey, content);
  }

  Future<Map<String, dynamic>> readGuess() async {
    await initSpWhenNull();
    String content = _sp!.getString(kGuessSpKey) ?? "{}";
    return json.decode(content);
  }

  Future<bool> saveTempleBlockConfig(
      {required int selectedImageIndex,
      required int selectedSoundIndex,
      required int totalMeritCount}) async {
    await initSpWhenNull();
    String content = json.encode({
      'selectedImageIndex': selectedImageIndex,
      'selectedSoundIndex': selectedSoundIndex,
      'totalMeritCount': totalMeritCount
    });
    return _sp!.setString(kTempleBlockSpKey, content);
  }

  Future<Map<String, dynamic>> readTempleBlockConfig() async {
    await initSpWhenNull();
    String content = _sp!.getString(kTempleBlockSpKey) ?? "{}";
    return json.decode(content);
  }
}
