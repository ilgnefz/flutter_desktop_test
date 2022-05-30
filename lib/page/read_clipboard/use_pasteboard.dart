import 'dart:convert';

// import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desktop_test/page/read_clipboard/use_clipboard.dart';
import 'package:flutter_desktop_test/widgets/title_divider.dart';
import 'package:pasteboard/pasteboard.dart';
import 'package:url_launcher/url_launcher.dart';

class UsePasteboard extends StatefulWidget {
  const UsePasteboard({Key? key}) : super(key: key);

  @override
  State<UsePasteboard> createState() => _UsePasteboardState();
}

class _UsePasteboardState extends State<UsePasteboard> {
  final TextEditingController _controller = TextEditingController();

  String _text = '还没粘贴任何内容';

  void _openExplorer() async {
    const _filePath = r'C:\Users\ilgnefz\Pictures';
    final Uri _uri = Uri.file(_filePath, windows: true);
    await launchUrl(_uri);
  }

  void _copyText() async {
    if (_controller.text.isEmpty) {
      BotToast.showText(text: '啥都没输入，你要我复制什么🥴');
    } else {
      Pasteboard.writeText(_controller.text);
    }
  }

  void _pastText() async {
    String? results = await Pasteboard.text;
    _text = results ?? '啥都没有';
    setState(() {});
  }

void _copyFile() async {
  if (_controller.text.isEmpty) {
    BotToast.showText(text: '啥都没输入，你要我复制什么🥴');
  } else {
    final lines = const LineSplitter().convert(_controller.text);
    await Pasteboard.writeFiles(lines);
  }
}

  void _pastFile() async {
    final results = await Pasteboard.files();
    if (results.isNotEmpty) {
      // _text = results.toString();
      _text = '';
      for (final result in results) {
        _text += '$result\n';
      }
      setState(() {});
    } else {
      BotToast.showText(text: '我什么都不能给你，因为我也咩有😭');
    }
  }

  void _useCtrC() async {
    if (_controller.text.isEmpty) {
      BotToast.showText(text: '啥都没输入，你要我复制什么🥴');
    } else {
      await FlutterClipboard.controlC(_controller.text);
    }
  }

  void _useCtrV() async {
    ClipboardData result = await FlutterClipboard.controlV();
    _text = result.text.toString();
    setState(() {});
  }

  void _useCopy() async {
    if (_controller.text.isEmpty) {
      BotToast.showText(text: '啥都没输入，你要我复制什么🥴');
    } else {
      await FlutterClipboard.copy(_controller.text);
    }
  }

  void _usePaste() async {
    _text = await FlutterClipboard.paste();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: '请输入要复制的内容',
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: _openExplorer,
                      child: const Text('打开文件浏览器'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: '粘贴的内容：',
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: _text,
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                // if (_image != null)
                //   Expanded(
                //     child: Image.memory(_image!),
                //   ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              const TitleDivider('pasteboard'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: _copyText, child: const Text('复制文本')),
                  ElevatedButton(
                      onPressed: _pastText, child: const Text('粘贴文本')),
                  ElevatedButton(
                      onPressed: _copyFile, child: const Text('复制文件')),
                  ElevatedButton(
                      onPressed: _pastFile, child: const Text('粘贴文件')),
                  // ElevatedButton(onPressed: _copyImage, child: const Text('复制图片')),
                  // ElevatedButton(onPressed: _pastImage, child: const Text('粘贴图片')),
                ],
              ),
              const TitleDivider('clipboard'),
              UseClipboard(
                onTap0: _useCtrC,
                onTap1: _useCtrV,
                onTap2: _useCopy,
                onTap3: _usePaste,
              )
            ],
          ),
        ),
      ],
    );
  }
}
