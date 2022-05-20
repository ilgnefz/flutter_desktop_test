import 'package:bot_toast/bot_toast.dart';
import 'package:contextual_menu/contextual_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide MenuItem;

class UseContextualMenu extends StatefulWidget {
  const UseContextualMenu({Key? key}) : super(key: key);

  @override
  State<UseContextualMenu> createState() => _UseContextualMenuState();
}

class _UseContextualMenuState extends State<UseContextualMenu> {
  bool _openContext = false;
  Color _color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
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
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (e) {
            _color = Colors.grey.withOpacity(.1);
            setState(() {});
          },
          onExit: (e) {
            _color = Colors.transparent;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 48,
            width: 250,
            decoration: BoxDecoration(
              color: _color,
              border: Border.all(color: Colors.black26),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            alignment: Alignment.center,
            child: const Text('点击右键选择'),
          ),
        ),
      ),
    );
  }
}

_showContext() {
  Menu _menu = Menu(
    items: [
      MenuItem(label: '风起陇西'),
      MenuItem.separator(),
      MenuItem.submenu(
        label: '9号秘事 第七季',
        sublabel: '第七季',
        submenu: Menu(
          items: [
            MenuItem.checkbox(
              label: '9号秘事 第一季',
              checked: false,
              onClick: (menuItem) {
                BotToast.showText(text: '即将播放《9号秘事 第一季》');
              },
            ),
            MenuItem.checkbox(label: '9号秘事 第二季', checked: false),
            MenuItem.checkbox(label: '9号秘事 第三季', checked: false),
            MenuItem.checkbox(label: '9号秘事 第四季', checked: false),
            MenuItem.checkbox(label: '9号秘事 第五季', checked: false),
            MenuItem.checkbox(label: '9号秘事 第六季', checked: false),
            MenuItem.checkbox(label: '9号秘事 第七季', checked: true),
          ],
        ),
      ),
    ],
  );
  popUpContextualMenu(
    _menu,
    // position: Offset.zero,
    placement: Placement.topLeft,
  );
}
