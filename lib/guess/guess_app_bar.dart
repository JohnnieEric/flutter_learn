import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuessAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCheck;
  final TextEditingController controller;

  const GuessAppBar(
      {super.key, required this.onCheck, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //左侧
      leading: const Icon(Icons.menu, color: Colors.black),
      //右侧列表
      actions: [
        IconButton(
            splashRadius: 20,
            /**
             * final VoidCallback? onPressed;
             *
             * onPressed: () =>_doCheckNumber() 和 onPressed: _doCheckNumber的区别
             *
             * ()=>_doCheckNumber() 等价 { return  doCheckNumber() }
             *
             * onPressed: _doCheckNumber???为什么有效
             */
            onPressed: _doCheckNumber,
            icon: const Icon(Icons.run_circle_outlined, color: Colors.blue))
      ],
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //中间部分
      title: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        /**
         *  final ValueChanged<String>? onSubmitted;
         *
         * onSubmitted: (_) => _doCheckNumber和onSubmitted: (_) => _doCheckNumber()存在区别？？？
         * onSubmitted: (_) => _doCheckNumber 等于onSubmitted方法返回了_doCheckNumber函数的指针
         * onSubmitted: (_) => _doCheckNumber() 等价于onSubmitted方法返回了_doCheckNumber函数的返回值
         * 前者没有调用_doCheckNumber方法，后者才真正调用了_doCheckNumber方法
         *
         *
         * ValueChanged和VoidCallback的区别？？？
         */
        onSubmitted: (_) => _doCheckNumber(),
        decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xfff3f6f9),
            constraints: BoxConstraints(maxHeight: 35),
            border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            hintText: "输入 0~99 数字",
            hintStyle: TextStyle(fontSize: 14)),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _doCheckNumber() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    onCheck();
  }
}
