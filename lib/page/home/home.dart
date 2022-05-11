import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/page/about_mouse/about_mouse.dart';
import 'package:flutter_desktop_test/page/custom_tooltip/custom_tooltip.dart';
import 'package:flutter_desktop_test/page/desktop_test/desktop_test.dart';
import 'package:flutter_desktop_test/page/drop_file/drop_file.dart';
import 'package:flutter_desktop_test/page/hot_key/hot_key.dart';
import 'package:flutter_desktop_test/page/read_clipboard/read_clipboard.dart';
import 'package:flutter_desktop_test/page/send_notify/send_notify.dart';
import 'package:flutter_desktop_test/page/set_context_menu/set_context_menu.dart';
import 'package:flutter_desktop_test/page/system_tray_manager/system_tray_manager.dart';
import 'package:flutter_desktop_test/page/upload_file/upload_file.dart';
import 'package:flutter_desktop_test/page/use_webview/use_web_view.dart';
import 'package:window_manager/window_manager.dart';

import 'welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  final List<Widget> _pages = [
    const WelcomePage(),
    const SendNotifyPage(),
    const SystemTrayManagerPage(),
    const DropFilePage(),
    const UploadFilePage(),
    const ReadClipboardPage(),
    const UseWebView(),
    const SetContextMenuPage(),
    const AboutMousePage(),
    const CustomTooltip(),
    const HotKeyPage(),
    const DesktopTestPage(),
  ];

  final List<String> _titles = [
    '欢迎界面',
    '发送通知',
    '系统托盘管理',
    '拖入文件到程序',
    '上传文件',
    '读取剪切板',
    'WebView',
    '上下文菜单',
    '鼠标事件',
    '自定义Tooltip',
    '快捷键',
    '测试专用',
  ];

  int _currentIndex = 0;

  void _closeApp() async {
    await windowManager.setPreventClose(true);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    windowManager.addListener(this);
    _closeApp();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {
    bool _isClose = await windowManager.isPreventClose();
    if (_isClose) {
      showDialog<void>(
        context: context,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('警告'),
            content: const Text('即将关闭本程序，是否继续？'),
            actions: <Widget>[
              TextButton(
                child: const Text('取消'),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
              TextButton(
                child: const Text('关闭'),
                onPressed: () async {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  await windowManager.destroy();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _currentIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        _titles[index],
                        style: TextStyle(
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                      color: _currentIndex == index
                          ? Colors.blue.withOpacity(.8)
                          : Colors.white,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Divider(color: Colors.grey[200]),
                  );
                },
                itemCount: _titles.length,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),
          )
        ],
      ),
    );
  }
}
