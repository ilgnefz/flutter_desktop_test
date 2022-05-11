import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/page/hot_key/use_flutter_widget.dart';
import 'package:flutter_desktop_test/page/hot_key/use_hotkey_manager.dart';

class HotKeyPage extends StatefulWidget {
  const HotKeyPage({Key? key}) : super(key: key);

  @override
  State<HotKeyPage> createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotKeyPage> {
  bool _flag = true;

  void _switchFlag() {
    _flag = !_flag;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _switchFlag,
        child: const Icon(Icons.autorenew),
      ),
      body: _flag ? const UseHotKeyManager() : const UseFlutterWidget(),
    );
  }
}
