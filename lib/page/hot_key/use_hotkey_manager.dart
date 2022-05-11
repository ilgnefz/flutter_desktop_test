import 'package:flutter/material.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

class UseHotKeyManager extends StatefulWidget {
  const UseHotKeyManager({Key? key}) : super(key: key);

  @override
  State<UseHotKeyManager> createState() => _UseHotKeyManagerState();
}

class _UseHotKeyManagerState extends State<UseHotKeyManager> {
  String _message = '你还未按下任何快捷键';
  int _count = 0;

  HotKey _hotKey = HotKey(KeyCode.f2, modifiers: [KeyModifier.alt]);
  HotKey? _newHotKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() async {
    await hotKeyManager.unregisterAll();
    _register(_hotKey);
  }

  _register(HotKey hotKey) async {
    await hotKeyManager.register(
      hotKey,
      keyDownHandler: (hotKey) {
        _count++;
        if (hotKey.modifiers == null) {
          _message = '按下了快捷键${hotKey.keyCode.keyLabel} $_count次';
        } else {
          _message = '按下了快捷键';
          for (var key in hotKey.modifiers!) {
            _message += '${key.keyLabel} + ';
          }
          _message += '${hotKey.keyCode.keyLabel} $_count次';
        }
        setState(() {});
      },
    );
    hotKeyManager.registeredHotKeyList;
  }

  _unregister(HotKey hotKey) async {
    if (hotKeyManager.registeredHotKeyList.contains(hotKey)) {
      await hotKeyManager.unregister(hotKey);
      _message = '快捷键注销成功';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_message),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _unregister(_hotKey),
            child: const Text('注销快捷键'),
          ),
          const SizedBox(height: 12),
          // HotKeyVirtualView(hotKey: _hotKey),
          HotKeyRecorder(
            initalHotKey: _hotKey,
            onHotKeyRecorded: (hotKey) {
              _newHotKey = hotKey;
              // _newHotKey?.scope = HotKeyScope.inapp;
              setState(() {});
            },
          ),
          TextButton(
            onPressed: _newHotKey == null
                ? () {}
                : () async {
                    _count = 0;
                    _unregister(_hotKey);
                    _hotKey = _newHotKey!;
                    _register(_hotKey);
                    _newHotKey = null;
                    _message = '快捷键修改成功';
                    setState(() {});
                  },
            child: const Text('更改快捷键'),
          ),
        ],
      ),
    );
  }
}
