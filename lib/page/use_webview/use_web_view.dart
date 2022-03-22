import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'has_web_view.dart';

class UseWebView extends StatefulWidget {
  const UseWebView({Key? key}) : super(key: key);

  @override
  State<UseWebView> createState() => _UseWebViewState();
}

class _UseWebViewState extends State<UseWebView> {
  bool _available = false;

  void _verifyAvailable() async {
    _available = await WebviewWindow.isWebviewAvailable();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: _available ? const HasWebView() : noWebView(),
    );
  }

  Widget noWebView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('你的设备缺少WebView2 Runtime，复制以下链接到浏览器进行下载'),
          SizedBox(height: 8),
          SelectableText(
            'https://go.microsoft.com/fwlink/p/?LinkId=2124703',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
