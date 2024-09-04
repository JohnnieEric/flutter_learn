import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuessAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  
  const GuessAppBar({super.key});

  
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //左侧
      leading: const Icon(Icons.menu, color: Colors.black),
      //右侧列表
      actions: [
        IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: const Icon(Icons.run_circle_outlined, color: Colors.blue))
      ],
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //中间部分
      title: const TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
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
  
}