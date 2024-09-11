import 'package:dio/dio.dart';
import 'package:flutter_learn_demo/article/bean/article_data.dart';

class ArticleApi {
  static const String baseUrl = 'https://www.wanandroid.com';
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<ArticleData>> getArticlesList(int page) async {
    String path = '/article/list/$page/json';
    var rep = await dio.get(path);
    if (rep.statusCode != 200 || rep.data == null) return [];
    var data = rep.data['data']['datas'] as List;
    return data.map(ArticleData.formMap).toList();
   }
}
