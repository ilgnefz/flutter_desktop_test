// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:win_toast/win_toast.dart';
// import 'package:path/path.dart' as path;
//
// class UseWinToast extends StatefulWidget {
//   const UseWinToast({Key? key}) : super(key: key);
//
//   @override
//   State<UseWinToast> createState() => _UseWinToastState();
// }
//
// class _UseWinToastState extends State<UseWinToast> {
//   void _initToast() {
//     WinToast.instance().initialize(
//       aumId: 'hiden.intelligence.flutter_desktop_test',
//       displayName: '第一个Desktop应用',
//       iconPath: '',
//     );
//   }
//
//   void _winToast(String type, BuildContext context) async {}
//
//   Future<void> _winToast() {
//     const xml = """
// <?xml version="1.0" encoding="UTF-8"?>
// <toast launch="action=viewConversation&amp;conversationId=9813">
//    <visual>
//       <binding template="ToastGeneric">
//          <text>Andrew sent you a picture</text>
//          <text>Check this out, Happy Canyon in Utah!</text>
//       </binding>
//    </visual>
//    <actions>
//       <input id="tbReply" type="text" placeHolderContent="Type a reply" />
//       <action content="Reply" activationType="background" arguments="action=reply&amp;conversationId=9813" />
//       <action content="Like" activationType="background" arguments="action=like&amp;conversationId=9813" />
//       <action content="View" activationType="background" arguments="action=viewImage&amp;imageUrl=https://picsum.photos/364/202?image=883" />
//    </actions>
// </toast>
//   """;
//     WinToast.instance().showCustomToast(xml: xml);
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _initToast();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => _winToast(_titles[index], context),
//       child: Text('发送 ${_titles[index]} 通知'),
//     );
//   }
// }
