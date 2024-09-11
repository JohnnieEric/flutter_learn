class ArticleData {
  final String title;
  final String url;
  final String time;
  final String author;

  ArticleData(
      {required this.title,
      required this.url,
      required this.time,
      this.author = ""});

  factory ArticleData.formMap(dynamic map) {
    return ArticleData(
        title: map['title'] ?? '未知',
        url: map['link'] ?? '',
        time: map['niceShareDate'] ?? '',
        author: map['author'] ?? '');
  }

  @override
  String toString() {
    return 'ArticleData{title: $title, url: $url, time: $time, author: $author}';
  }
}
