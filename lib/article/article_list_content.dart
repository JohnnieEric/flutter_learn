import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/article/article_api.dart';
import 'package:flutter_learn_demo/article/webview_page.dart';

import 'article_item.dart';
import 'bean/article_data.dart';

class ArticleListContent extends StatefulWidget {
  const ArticleListContent({super.key});

  @override
  State<StatefulWidget> createState() => _ArticleListContentState();
}

class _ArticleListContentState extends State<ArticleListContent> {
  List<ArticleData> _articleList = [];
  final ArticleApi _articleApi = ArticleApi();

  @override
  void initState() {
    super.initState();
    _getArticleListData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => _buildItemByIndex(index),
      itemCount: _articleList.length,
      itemExtent: 80,
    );
  }

  void _getArticleListData() async {
    _articleList = await _articleApi.getArticlesList(0);
    setState(() {});
  }

  Widget _buildItemByIndex(int index) {
    return ArticleItem(
      articleData: _articleList[index],
      onTap: () {
        _onTapItem(index);
      },
    );
  }

  void _onTapItem(int index) {
    ArticleData articleData = _articleList[index];
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WebViewPage(
        url: articleData.url,
        title: articleData.title,
      );
    }));
  }
}
