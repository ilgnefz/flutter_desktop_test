import 'package:flutter/material.dart';
import 'package:native_context_menu/native_context_menu.dart';

class DesktopTestPage extends StatefulWidget {
  const DesktopTestPage({Key? key}) : super(key: key);

  @override
  State<DesktopTestPage> createState() => _DesktopTestPageState();
}

class _DesktopTestPageState extends State<DesktopTestPage> {
  String? action;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ContextMenuRegion(
          onDismissed: () => setState(() => action = 'Menu was dismissed'),
          onItemSelected: (item) => setState(() {
            action = '${item.title} was selected';
          }),
          menuItems: [
            MenuItem(title: 'First item'),
            MenuItem(title: 'Second item'),
            MenuItem(
              title: 'Third item with submenu',
              items: [
                MenuItem(title: 'First subitem'),
                MenuItem(title: 'Second subitem'),
                MenuItem(title: 'Third subitem'),
              ],
            ),
            MenuItem(title: 'Fourth item'),
          ],
          child: Card(
            child: Center(
              child: Text(action ?? 'Right click me'),
            ),
          ),
        ),
      ),
    );
  }
}
