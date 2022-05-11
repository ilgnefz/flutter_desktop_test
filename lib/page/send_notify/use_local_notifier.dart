import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';

class UseLocalNotifier extends StatefulWidget {
  const UseLocalNotifier({Key? key}) : super(key: key);

  @override
  State<UseLocalNotifier> createState() => _UseLocalNotifierState();
}

class _UseLocalNotifierState extends State<UseLocalNotifier> {
  void _localNot() {
    final notification = LocalNotification(
      // 用来生成通用唯一识别码
      identifier: '12345',
      title: '古诗鉴赏从',
      subtitle: '桃夭 - 佚名〔先秦〕',
      body: '桃之夭夭，灼灼其华。之子于归，宜其室家。\n桃之夭夭，有蕡其实。之子于归，宜其家室。\n桃之夭夭，其叶蓁蓁。之子于归，宜其家人。',
      // 用来设置是否静音
      silent: true,
      // actions: [
      //   LocalNotificationAction(text: '学废了'),
      //   LocalNotificationAction(text: '没学废'),
      // ],
    );
    notification.onShow = () {
      BotToast.showText(text: '显示了一条通知');
    };
    // TODO
    notification.onClose = (vale) {
      BotToast.showText(text: '通知已经关闭');
    };
    notification.onClick = () {
      BotToast.showText(text: '通知被点击了');
    };
    notification.onClickAction = (index) {
      BotToast.showText(text: '你点击了通知的第$index个选项');
    };
    notification.show();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _localNot,
      child: const Text('发送通知'),
    );
  }
}
