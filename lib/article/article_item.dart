import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/article/bean/article_data.dart';

class ArticleItem extends StatelessWidget {
  final ArticleData articleData;
  final VoidCallback onTap;

  const ArticleItem(
      {required this.articleData, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(color: Colors.grey, fontSize: 12);
    return GestureDetector(
      //onTap: () => onTap 错误，()=>表示return function
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      articleData.title,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(articleData.time)
                ],
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                            style: subtitleStyle,
                            articleData.url,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        articleData.author,
                        style: subtitleStyle,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
