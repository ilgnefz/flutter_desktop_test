/*
* 该插件在pub.dev中标记为[UNIDENTIFIED]，暂不建议使用
*/

// import 'dart:io';
//
// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart' hide MenuItem;
// import 'package:system_tray/system_tray.dart';
// import 'package:window_manager/window_manager.dart';
//
// class UseSystemTrayPage extends StatefulWidget {
//   const UseSystemTrayPage({Key? key}) : super(key: key);
//
//   @override
//   State<UseSystemTrayPage> createState() => _UseSystemTrayPageState();
// }
//
// class _UseSystemTrayPageState extends State<UseSystemTrayPage> {
//   final SystemTray _systemTray = SystemTray();
//
//   final String _title = '第一个Desktop应用';
//   // final String _newTitle = '说Hello';
//   final String _toolTip = '看什么看';
//   final String _newToolTip = '怎么肥四啊';
//   final String _iconPathWin = 'assets/images/system_tray.ico';
//   final String _iconPathOther = 'assets/images/system_tray.png';
//   final String _anotherIconWin = 'assets/images/another.ico';
//   final String _anotherIconOther = 'assets/images/another.png';
//
//   void _initTray() async {
//     String _iconPath = Platform.isWindows ? _iconPathWin : _iconPathOther;
//     await _systemTray.initSystemTray(
//         title: _title, iconPath: _iconPath, toolTip: _toolTip);
//   }
//
//   // void _getTitle() async {
//   //   String _theTitle = await _systemTray.getTitle();
//   //   BotToast.showText(text: _theTitle);
//   // }
//
//   void _modifyInfo() async {
//     String _newPath = Platform.isWindows ? _anotherIconWin : _anotherIconOther;
//     await _systemTray.setToolTip(_newToolTip);
//     await _systemTray.setImage(_newPath);
//     // await _systemTray.setTitle(_newTitle);
//     setState(() {});
//   }
//
//   void _floorNumber(String floor) {
//     BotToast.showText(text: '你已经到达$floor');
//   }
//
//   void _setMenu() async {
//     final menus = [
//       MenuItem(label: '五楼', onClicked: () => _floorNumber('五楼')),
//       MenuItem(label: '四楼', onClicked: () => _floorNumber('四楼')),
//       SubMenu(
//         label: '三楼',
//         children: [
//           MenuItem(label: '三楼厕所', onClicked: () => _floorNumber('三楼厕所')),
//         ],
//       ),
//       MenuItem(label: '二楼', onClicked: () => _floorNumber('二楼')),
//       MenuItem(label: '一楼', enabled: false),
//     ];
//     await _systemTray.setContextMenu(menus);
//   }
//
//   void _registerEvent() {
//     _systemTray.registerSystemTrayEventHandler((eventName) {
//       if (eventName == 'leftMouseDown') {
//         windowManager.show();
//       } else if (eventName == 'rightMouseDown') {
//         _systemTray.popUpContextMenu();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 24,
//       runSpacing: 24,
//       children: [
//         ElevatedButton(
//           onPressed: _initTray,
//           child: const Text('初始化系统托盘'),
//         ),
//         // ElevatedButton(
//         //   onPressed: _getTitle,
//         //   child: const Text('获取标题'),
//         // ),
//         ElevatedButton(
//           onPressed: _modifyInfo,
//           child: const Text('修改信息'),
//         ),
//         ElevatedButton(
//           onPressed: _setMenu,
//           child: const Text('设置菜单'),
//         ),
//         ElevatedButton(
//           onPressed: _registerEvent,
//           child: const Text('注册事件'),
//         ),
//       ],
//     );
//   }
// }
