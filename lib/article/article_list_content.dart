import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
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
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _getArticleListData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isRefreshing) {
      return const Center(
        child: Wrap(
          spacing: 10,
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CupertinoActivityIndicator(),
            Text(
              '数据加载中...',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      );
    }
    return EasyRefresh(
        header: const ClassicHeader(
          dragText: '下拉刷新',
          armedText: '释放刷新',
          readyText: '开始加载',
          processedText: '正在加载',
        ),
        onRefresh: _onRefresh,
        onLoad: _onLoad,
        child: ListView.builder(
          itemBuilder: (_, index) => _buildItemByIndex(index),
          itemCount: _articleList.length,
          itemExtent: 80,
        ));
  }

  void _onRefresh() async {
    _articleList = await _articleApi.getArticlesList(0);
    setState(() {});
  }

  void _onLoad() async {
    int nextPage = _articleList.length ~/ 20;
    List<ArticleData> list = await _articleApi.getArticlesList(nextPage);
    _articleList = _articleList + list;
    setState(() {});
  }

  void _getArticleListData() async {
    _isRefreshing = true;
    setState(() {});
    _articleList = await _articleApi.getArticlesList(0);
    _isRefreshing = false;
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
