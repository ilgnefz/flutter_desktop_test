import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:desktop_context_menu/desktop_context_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UseDesktopContextMenu extends StatefulWidget {
  const UseDesktopContextMenu({Key? key}) : super(key: key);

  @override
  State<UseDesktopContextMenu> createState() => _UseDesktopContextMenuState();
}

class _UseDesktopContextMenuState extends State<UseDesktopContextMenu> {
  bool _openContext = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) {
        _openContext = e.kind == PointerDeviceKind.mouse &&
            e.buttons == kSecondaryMouseButton;
        setState(() {});
      },
      onPointerUp: (e) {
        if (_openContext) {
          _showContext();
          _openContext = false;
        }
      },
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          alignment: Alignment.center,
          child: const Text(
            '茔茔蔓草，\n岁岁不老；\n风雨如晦，\n死生为谁。\n终南有坟，名不老。',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              height: 1.8,
            ),
          ),
        ),
      ),
    );
  }

  _showContext() async {
    final _menu = await showContextMenu(
      menuItems: [
        ContextMenuItem(
          title: '新建',
          onTap: () {},
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyN,
            meta: Platform.isMacOS,
            control: Platform.isWindows,
          ),
        ),
        const ContextMenuSeparator(),
        ContextMenuItem(
          title: '剪切',
          onTap: () {
            BotToast.showText(text: '你按了剪切');
          },
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyV,
            meta: Platform.isMacOS,
            control: Platform.isWindows,
          ),
        ),
        ContextMenuItem(
          title: '复制',
          onTap: () {
            BotToast.showText(text: '你按了复制');
          },
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyC,
            meta: Platform.isMacOS,
            control: Platform.isWindows,
          ),
        ),
        ContextMenuItem(
          title: '粘贴',
          onTap: () {
            BotToast.showText(text: '你按了粘贴');
          },
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyV,
            meta: Platform.isMacOS,
            control: Platform.isWindows,
          ),
        ),
      ],
    );
    if (_menu == null) return;
    BotToast.showText(text: _menu.title ?? '');
    _menu.onTap?.call();
  }
}
