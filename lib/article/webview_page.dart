import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewPage({super.key, required this.url,required this.title});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webViewController;
  @Deprecated("该方法打开页面会由于时间差先崩溃再刷新")
  late Widget? titleWidget;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      /*..setNavigationDelegate(NavigationDelegate(onPageFinished: (url) {
        getAppBarTitle();
      }))*/
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: WebViewWidget(controller: _webViewController));
  }

  ///该方法打开页面会由于时间差先崩溃再刷新
  @Deprecated("该方法打开页面会由于时间差先崩溃再刷新")
  void getAppBarTitle() {
    setState(() {
      titleWidget = FutureBuilder(
          future: _webViewController.getTitle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data}");
            } else {
              return const Text("Loading");
            }
          });
    });
  }
}
