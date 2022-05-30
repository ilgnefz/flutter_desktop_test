import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/page/hot_key/use_flutter_widget.dart';
import 'package:flutter_desktop_test/page/read_clipboard/use_text_extractor.dart';

import 'use_clipboard.dart';
import 'use_pasteboard.dart';

class ReadClipboardPage extends StatefulWidget {
  const ReadClipboardPage({Key? key}) : super(key: key);

  @override
  State<ReadClipboardPage> createState() => _ReadClipboardPageState();
}

class _ReadClipboardPageState extends State<ReadClipboardPage> {
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
      body: _flag ? const UseTextExtractor() : const UsePasteboard(),
    );
  }
}
