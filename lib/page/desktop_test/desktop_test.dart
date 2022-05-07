import 'dart:io';

import 'package:desktop_context_menu/desktop_context_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DesktopTestPage extends StatefulWidget {
  const DesktopTestPage({Key? key}) : super(key: key);

  @override
  State<DesktopTestPage> createState() => _DesktopTestPageState();
}

class _DesktopTestPageState extends State<DesktopTestPage> {
  bool _openContextMenu = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      /// Listener.onPointerUp cannot check if the clicked mouse button is
      /// the secondary one.
      onPointerDown: (event) {
        _openContextMenu = event.kind == PointerDeviceKind.mouse &&
            event.buttons == kSecondaryMouseButton;
      },
      onPointerUp: (event) {
        if (!_openContextMenu) {
          return;
        }

        _openContextMenu = false;

        _showContextMenu();
      },
      child: const Center(
        child: Text('right click anywhere to open context menu'),
      ),
    );
  }

  void _showContextMenu() async {
    final selectedItem = await showContextMenu(
      menuItems: [
        ContextMenuItem(
          title: 'Copy',
          onTap: () {
            print('CCCCCCCCCCCCC');
          },
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyC,
            meta: Platform.isMacOS,
            control: Platform.isWindows,
          ),
        ),
        ContextMenuItem(
          title: 'Paste',
          onTap: () {},
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyV,
            meta: Platform.isMacOS,
            control: Platform.isWindows,
          ),
        ),
        ContextMenuItem(
          title: 'Paste as values',
          onTap: () {},
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyV,
            meta: Platform.isMacOS,
            control: Platform.isWindows,
            shift: true,
          ),
        ),
        const ContextMenuSeparator(),
        ContextMenuItem(
          title: 'Item number two',
          onTap: () {},
        ),
        const ContextMenuItem(title: 'Disabled item'),
        const ContextMenuItem(
          title: 'Disabled item with shortcut',
          shortcut: SingleActivator(
            LogicalKeyboardKey.keyV,
            meta: true,
            shift: true,
          ),
        ),
        const ContextMenuSeparator(),
        ContextMenuItem(
          title: 'Zoom in',
          shortcut: const SingleActivator(
            LogicalKeyboardKey.add,
            alt: true,
          ),
          onTap: () {},
        ),
        ContextMenuItem(
          title: 'Zoom out',
          shortcut: const SingleActivator(
            LogicalKeyboardKey.minus,
            alt: true,
          ),
          onTap: () {},
        ),
        const ContextMenuSeparator(),
        ContextMenuItem(
          title: 'Control shortcut',
          shortcut: const SingleActivator(
            LogicalKeyboardKey.keyJ,
            control: true,
          ),
          onTap: () {},
        ),
      ],
    );

    if (selectedItem == null) {
      return null;
    }

    print(selectedItem.title);
  }
}
