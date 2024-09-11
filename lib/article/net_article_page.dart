import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/article/article_list_content.dart';

class NetArticlePage extends StatelessWidget {
  const NetArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络文章'),
      ),
      body: const ArticleListContent(),
    );
  }
}
