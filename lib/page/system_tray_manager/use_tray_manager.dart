import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_desktop_test/page/system_tray_manager/use_system_tray.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class UseTrayManagerPage extends StatefulWidget {
  const UseTrayManagerPage({Key? key}) : super(key: key);

  @override
  State<UseTrayManagerPage> createState() => _UseTrayManagerPageState();
}

class _UseTrayManagerPageState extends State<UseTrayManagerPage>
    with TrayListener {
  Timer? _timer;
  bool _hasIcon = false;
  bool _checked = true;

  final TrayManager _trayManager = TrayManager.instance;

  final String _iconPathWin = 'assets/images/tray_manager.ico';
  final String _iconPathOther = 'assets/images/tray_manager.png';
  final String _iconNullWin = 'assets/images/null.ico';
  final String _iconNullOther = 'assets/images/null.png';

  void _generateIcon() async {
    await _trayManager
        .setIcon(Platform.isWindows ? _iconPathWin : _iconPathOther);
    _hasIcon = true;
  }

  void _iconFlash() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) async {
      if (_hasIcon) {
        await _trayManager
            .setIcon(Platform.isWindows ? _iconNullWin : _iconNullOther);
      } else {
        await _trayManager
            .setIcon(Platform.isWindows ? _iconPathWin : _iconPathOther);
      }
      _hasIcon = !_hasIcon;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _trayManager.addListener(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    _trayManager.removeListener(this);
    super.dispose();
  }

  void _closeIconFlash() {
    _timer?.cancel();
    _generateIcon();
  }

  void _generateToolTip() async {
    await _trayManager.setToolTip('你想干嘛😒');
  }

  void _generateContextMenu() async {
    Menu _menu = Menu(items: [
      MenuItem(label: '语文', icon: getImagePath('another')),
      MenuItem(label: '数学', toolTip: '躲不掉的'),
      MenuItem.checkbox(
        label: '英语',
        checked: true,
        onClick: (menuItem) {
          menuItem.checked = !(menuItem.checked == true);
        },
      ),
      MenuItem.separator(),
      MenuItem.submenu(
        key: 'science',
        label: '理科',
        submenu: Menu(items: [
          MenuItem(label: '物理'),
          MenuItem(label: '化学'),
          MenuItem(label: '生物'),
        ]),
      ),
      MenuItem.separator(),
      MenuItem.submenu(
        key: 'arts',
        label: '文科',
        submenu: Menu(items: [
          MenuItem(label: '政治'),
          MenuItem(label: '历史'),
          MenuItem(label: '地理'),
        ]),
      ),
    ]);
    await trayManager.setContextMenu(_menu);
  }

  void _getBound() async {
    Rect? rect = await _trayManager.getBounds();
    print('rect: $rect');
  }

  void _destroyTrayManager() async {
    await _trayManager.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _generateIcon,
          child: const Text('显示图标'),
        ),
        ElevatedButton(
          onPressed: _iconFlash,
          child: const Text('图标闪烁'),
        ),
        ElevatedButton(
          onPressed: _closeIconFlash,
          child: const Text('关闭闪烁'),
        ),
        ElevatedButton(
          onPressed: _generateToolTip,
          child: const Text('显示提示'),
        ),
        ElevatedButton(
          onPressed: _generateContextMenu,
          child: const Text('设置菜单'),
        ),
        ElevatedButton(
          onPressed: _getBound,
          child: const Text('获取边界'),
        ),
        ElevatedButton(
          onPressed: _destroyTrayManager,
          child: const Text('从托盘区移除'),
        ),
      ],
    );
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    BotToast.showText(text: '你选择了${menuItem.label}');
  }

  @override
  void onTrayIconRightMouseUp() {
    print('右击鼠标抬起');
  }

  @override
  void onTrayIconRightMouseDown() async {
    await _trayManager.popUpContextMenu();
  }

  @override
  void onTrayIconMouseUp() {
    print('托盘图标鼠标抬起');
  }

  @override
  void onTrayIconMouseDown() {
    windowManager.show();
  }
}
