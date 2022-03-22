import 'package:bot_toast/bot_toast.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class HasWebView extends StatefulWidget {
  const HasWebView({
    Key? key,
  }) : super(key: key);

  @override
  State<HasWebView> createState() => _HasWebViewState();
}

class _HasWebViewState extends State<HasWebView> {
  String _url = 'https://www.acfun.cn';

  final List<String> _allUrl = [];

  Future<String> _getDocument() async {
    final document = await getApplicationDocumentsDirectory();
    return path.join(document.path, 'flutter_desktop');
  }

  final _javaScriptToEval = [
    """
    function test() {
      return;
    }
    test();
    """,
    'eval({"name": "test", "user_agent": navigator.userAgent})',
    '1 + 1',
    'undefined',
    '1.0 + 1.0',
    '"test"',
  ];

  void _open() async {
    final webView = await WebviewWindow.create(
      configuration: CreateConfiguration(
        title: 'AcFun',
        userDataFolderWindows: await _getDocument(),
      ),
    );
    webView.addScriptToExecuteOnDocumentCreated('''
      window.onload = function() {
        console.log("Hello Flutter");
      }
    ''');
    webView.setApplicationNameForUserAgent('FlutterDesk');
    // webView.setOnHistoryChangedCallback((canGoBack, canGoForward) {
    //   print('canGoBack: $canGoBack');
    //   print('canGoForward: $canGoForward');
    // });
    webView.addOnUrlRequestCallback((url) {
      _allUrl.add(url);
      setState(() {});
    });
    webView.removeOnUrlRequestCallback((url) {});
    for (final javaScript in _javaScriptToEval) {
      try {
        final ret = await webView.evaluateJavaScript(javaScript);
        debugPrint('evaluateJavaScript: $ret');
      } catch (e) {
        debugPrint('evaluateJavaScript error: $e \n $javaScript');
      }
    }
    webView.onClose.whenComplete(() => BotToast.showText(text: 'Web窗口已关闭'));
    webView.launch(_url);
  }

  void _closeAll() async {
    WebviewWindow.clearAll()
        .whenComplete(() => BotToast.showText(text: '所有Web窗口已关闭'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('你已安装WebViewRuntime2'),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: TextEditingController(text: _url),
              onChanged: (value) {
                setState(() {
                  _url = value;
                  setState(() {});
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _open,
            child: const Text('打开'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _closeAll,
            child: const Text('关闭所有Web窗口'),
          ),
          const SizedBox(height: 16),
          const Text('浏览历史：'),
          ...List.generate(_allUrl.length, (index) => Text(_allUrl[index]))
              .toList(),
        ],
      ),
    );
  }
}
