import 'package:bot_toast/bot_toast.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/providers/upload_file.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'page/home/home.dart';

void main(List<String> args) async {
  if (runWebViewTitleBarWidget(args)) {
    return;
  }

  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  LocalNotifier.instance.setAppName('Flutter桌面应用');

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('Flutter桌面应用');
    await windowManager.setSize(const Size(800, 600));
    // await windowManager.maximize();
    await windowManager.setMinimumSize(const Size(800, 600));
    // await windowManager.center();
    await windowManager.show();
    // await windowManager.setSkipTaskbar(false);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UploadFileProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Microsoft YaHei',
        ),
        home: const HomePage(),
      ),
    );
  }
}
