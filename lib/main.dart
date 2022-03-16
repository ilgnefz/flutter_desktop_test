import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/providers/upload_file.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'page/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('我的第一个桌面应用');
    await windowManager.setSize(const Size(800, 600));
    await windowManager.setMinimumSize(const Size(800, 600));
    await windowManager.center();
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

final localNotifier = LocalNotifier.instance;
