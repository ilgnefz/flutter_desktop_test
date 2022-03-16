import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:win_toast/win_toast.dart';
import 'package:path/path.dart' as path;

class UseWinToast extends StatefulWidget {
  const UseWinToast({Key? key}) : super(key: key);

  @override
  State<UseWinToast> createState() => _UseWinToastState();
}

class _UseWinToastState extends State<UseWinToast> {
  final List<String> _titles = [
    'imageAndText01',
    'text01',
    'imageAndText02',
    'text02',
    'imageAndText03',
    'text03',
    'imageAndText04',
    'text04',
  ];

  void _initToast() async {
    await WinToast.instance().initialize(
      appName: '第一个Desktop应用',
      productName: '第一个Desktop应用',
      companyName: 'Hiden Intelligence',
    );
  }

  void _winToast(String type, BuildContext context) async {
    Toast? toast;

    final List<String> _actionOne = ['上一首', '播放/暂停', '下一首'];

    final List<String> _actionTwo = ['不开森😭', '只想睡觉🥱', '非常高兴😃'];

    final String _imagePath = path.join(path.current, 'assets/images/pdx.jpg');

    final List<String> _titles = [
      'Shining For One Thing(《一闪一闪亮星星》影视剧歌曲) - 赵贝尔',
      '又下雨了，你的心情怎么样？',
    ];

    final List<String> _subtitle = [
      'I fall in love\nI see your love\n遇见你才发现\n我在等你到来',
      '偷偷告诉你，明天就天晴了😏\n好雨知时节，当春乃发生。随风潜入夜，润物细无声。野径云俱黑，江船火独明。晓看红湿处，花重锦官城。',
    ];

    if (type == 'text01') {
      toast = await WinToast.instance().showToast(
        type: ToastType.text01,
        title: _titles[0],
        actions: _actionOne,
      );
    }
    if (type == 'text02') {
      toast = await WinToast.instance().showToast(
        type: ToastType.text02,
        title: _titles[0],
        subtitle: _subtitle[0],
        actions: _actionOne,
      );
    }
    if (type == 'text03') {
      toast = await WinToast.instance().showToast(
        type: ToastType.text03,
        title: _titles[0],
        subtitle: _subtitle[0],
        actions: _actionOne,
      );
    }
    if (type == 'text04') {
      toast = await WinToast.instance().showToast(
        type: ToastType.text04,
        title: _titles[0],
        subtitle: _subtitle[0],
        actions: _actionOne,
      );
    }
    if (type == 'imageAndText01') {
      toast = await WinToast.instance().showToast(
        type: ToastType.imageAndText01,
        title: _titles[1] * 3,
        imagePath: _imagePath,
        actions: _actionTwo,
      );
    }
    if (type == 'imageAndText02') {
      toast = await WinToast.instance().showToast(
        type: ToastType.imageAndText02,
        title: _titles[1],
        subtitle: _subtitle[1],
        imagePath: _imagePath,
        actions: _actionTwo,
      );
    }
    if (type == 'imageAndText03') {
      toast = await WinToast.instance().showToast(
        type: ToastType.imageAndText03,
        title: _titles[1],
        subtitle: _subtitle[1],
        imagePath: _imagePath,
        actions: _actionTwo,
      );
    }
    if (type == 'imageAndText04') {
      toast = await WinToast.instance().showToast(
        type: ToastType.imageAndText04,
        title: _titles[1],
        subtitle: _subtitle[1],
        imagePath: _imagePath,
        actions: _actionTwo,
      );
    }
    if (toast != null) {
      toast.eventStream.listen((event) {
        if (event is ActivatedEvent) {
          WinToast.instance().bringWindowToFront();
          if (type.startsWith('text')) {
            BotToast.showText(text: '你选择了${_actionOne[event.actionIndex!]}');
          } else {
            BotToast.showText(text: '你当前的状态是${_actionTwo[event.actionIndex!]}');
          }
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initToast();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: List.generate(
        _titles.length,
        (index) => ElevatedButton(
          onPressed: () => _winToast(_titles[index], context),
          child: Text('发送 ${_titles[index]} 通知'),
        ),
      ),
    );
  }
}
