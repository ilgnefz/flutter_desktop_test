import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/widgets/image_decorated.dart';
import 'package:flutter_desktop_test/widgets/title_divider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screen_capturer/screen_capturer.dart';
import 'package:screen_text_extractor/screen_text_extractor.dart';

class UseTextExtractor extends StatefulWidget {
  const UseTextExtractor({Key? key}) : super(key: key);

  @override
  State<UseTextExtractor> createState() => _UseTextExtractorState();
}

class _UseTextExtractorState extends State<UseTextExtractor> {
  String? _img;
  String? _text;
  ClipboardType? _type;

  void _screenShot() async {
    Directory _dir = await getApplicationDocumentsDirectory();
    String _imageName = '${DateTime.now().millisecondsSinceEpoch}.png';
    // String _imagePath ='${_dir.path}/$_imageName';
    String _imagePath = 'C:\\Users\\ilgnefz\\Pictures\\$_imageName';
    CapturedData? _capturedData =
        await ScreenCapturer.instance.capture(imagePath: _imagePath);
    if (_capturedData != null) {
      _img = _capturedData.imagePath;
      _type = ClipboardType.image;
      setState(() {});
    } else {
      BotToast.showText(text: '什么都没有发生');
    }
  }

  void _getClipboardText() async {
    ExtractedData data =
        await ScreenTextExtractor.instance.extractFromClipboard();
    _setText(data);
  }

  // void _getCtrlCText() async {
  //   bool data = await ScreenTextExtractor.instance.simulateCtrlCKeyPress();
  //   print(data);
  // }

  void _getScreenSelectionText() async {
    ExtractedData data =
        await ScreenTextExtractor.instance.extractFromScreenSelection(
      useAccessibilityAPIFirst: false, // 使用辅助功能API，仅macOS
    );
    _setText(data);
  }

  void _setText(ExtractedData data) {
    if (data.text!.isEmpty) {
      BotToast.showText(text: '剪切板什么都没有🤨');
    } else {
      if (_text == data.text!) {
        BotToast.showText(text: '换个内容再粘贴吧🥱');
      } else {
        _text = data.text;
        _type = ClipboardType.text;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleDivider('screen_text_extractor'),
        Expanded(child: Center(child: showType())),
        Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _screenShot,
                    child: const Text('截图'),
                  ),
                  ElevatedButton(
                    onPressed: _getClipboardText,
                    child: const Text('从剪切板获取'),
                  ),
                  ElevatedButton(
                    onPressed: _getScreenSelectionText,
                    child: const Text('从选区获取(win不可用)'),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget showType() {
    if (_type == ClipboardType.image) {
      return ImageDecorated(
        child: Image.file(File(_img!)),
      );
    }
    if (_type == ClipboardType.text) {
      return Text(_text!);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/cat.webp'),
        const SizedBox(height: 12),
        const Text('获取的内容将会在这里🤪'),
      ],
    );
  }
}

enum ClipboardType { text, image }
