import 'package:bot_toast/bot_toast.dart';
import 'package:contextmenu/contextmenu.dart';
import 'package:flutter/material.dart';

class UseContextmenu extends StatefulWidget {
  const UseContextmenu({Key? key}) : super(key: key);

  @override
  State<UseContextmenu> createState() => _UseContextmenuState();
}

class _UseContextmenuState extends State<UseContextmenu> {
  final List<String> _friends = ['海绵宝宝', '章鱼哥', '珊迪'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ContextMenuArea(
        builder: (context) => List.generate(
          _friends.length,
          (index) => ListTile(
            title: Text('给${_friends[index]}打电话'),
            onTap: () => BotToast.showText(text: '正在联系${_friends[index]}'),
          ),
        ).toList(),
        child: Image.asset('assets/images/pdx.jpg'),
      ),
    );
  }
}
