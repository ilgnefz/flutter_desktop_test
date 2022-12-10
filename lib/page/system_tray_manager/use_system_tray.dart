import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:system_tray/system_tray.dart';

class UseSystemTrayPage extends StatefulWidget {
  const UseSystemTrayPage({Key? key}) : super(key: key);

  @override
  State<UseSystemTrayPage> createState() => _UseSystemTrayPageState();
}

String getImagePath(String imageName) {
  return Platform.isWindows
      ? 'assets/images/$imageName.bmp'
      : 'assets/images/$imageName.png';
}

class _UseSystemTrayPageState extends State<UseSystemTrayPage> {
  final String _title = 'Flutter桌面应用';
  final String _toolTip = '看什么看';
  final String _iconPathWin = 'assets/images/system_tray.ico';
  final String _iconPathOther = 'assets/images/system_tray.png';
  final String _newToolTip = '怎么肥四啊';
  final String _anotherIconWin = 'assets/images/another.ico';
  final String _anotherIconOther = 'assets/images/another.png';

  final SystemTray _systemTray = SystemTray();
  final Menu _menu = Menu();
  final AppWindow _appWindow = AppWindow();

  void _initSystemTray() {
    String iconPath = Platform.isWindows ? _iconPathWin : _iconPathOther;
    _systemTray.initSystemTray(
        iconPath: iconPath, title: _title, toolTip: _toolTip);
  }

  void _modifySystemTrayInfo() async {
    String iconPath = Platform.isWindows ? _anotherIconWin : _anotherIconOther;
    await _systemTray.setSystemTrayInfo(
        iconPath: iconPath, toolTip: _newToolTip);
  }

  void _setMenu() async {
    await _menu.buildFrom([
      MenuItemLabel(label: '五楼'),
      MenuItemLabel(label: '四楼', image: getImagePath('another')),
      SubMenu(
        label: '三楼',
        children: [MenuItemLabel(label: '教室'), MenuItemLabel(label: '自习室')],
      ),
      MenuItemCheckbox(
        label: '二楼',
        name: 'second',
        checked: true,
        onClicked: (menuItem) async {
          MenuItemCheckbox? second =
              _menu.findItemByName<MenuItemCheckbox>('second');
          await second?.setCheck(!second.checked);
        },
      ),
      MenuItemCheckbox(
        label: '一楼',
        onClicked: (menuItem) async {
          await menuItem.setCheck(!menuItem.checked);
        },
      ),
      MenuSeparator(),
      MenuItemLabel(label: '地下室'),
    ]);
    await _systemTray.setContextMenu(_menu);

    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? _appWindow.show() : _systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? _systemTray.popUpContextMenu() : _appWindow.show();
      } else if (eventName == kSystemTrayEventDoubleClick) {
        BotToast.showText(text: '点一次就够了！');
      }
    });
  }

  void _remove() async {
    await _systemTray.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _initSystemTray,
          child: const Text('初始化'),
        ),
        ElevatedButton(
          onPressed: _modifySystemTrayInfo,
          child: const Text('修改信息'),
        ),
        ElevatedButton(
          onPressed: _setMenu,
          child: const Text('设置菜单'),
        ),
        ElevatedButton(
          onPressed: _remove,
          child: const Text('移除图标'),
        ),
      ],
    );
  }
}
