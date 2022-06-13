import 'dart:convert';
import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/providers/upload_file.dart';

class UseFileSelectorPage extends StatefulWidget {
  const UseFileSelectorPage(this.provider, {Key? key}) : super(key: key);

  final UploadFileProvider provider;

  @override
  State<UseFileSelectorPage> createState() => _UseFileSelectorPageState();
}

class _UseFileSelectorPageState extends State<UseFileSelectorPage> {
  void _pickOneImage() async {
    const String label = 'image';
    final XTypeGroup xType =
        XTypeGroup(label: label, extensions: ['jpg', 'png']);
    final XFile? file = await openFile(
      acceptedTypeGroups: [xType],
      // initialDirectory: r'C:\Users\ilgnefz\Pictures',
      // confirmButtonText: '嘿嘿嘿',
    );
    if (file != null) {
      widget.provider.clearFilePathList();
      widget.provider.setFilePath(file.path);
      widget.provider.setFileType(label);
    } else {
      BotToast.showText(text: '你不选择图片打开干啥😤');
    }
  }

  void _pickMultiImage() async {
    const label = 'multiImage';
    final xType = XTypeGroup(label: label, extensions: ['jpg', 'png']);
    final List<XFile> files = await openFiles(acceptedTypeGroups: [xType]);
    if (files.isNotEmpty) {
      List<String> paths = files.map((e) => e.path).toList();
      if (paths.length == 1 && widget.provider.filePathList.isEmpty) {
        widget.provider.setFilePath(paths.first);
        // widget.provider.setFilePathList(paths);
        widget.provider.setFileType('image');
      } else {
        widget.provider.setFilePathList(paths);
        widget.provider.setFileType(label);
      }
    } else {
      BotToast.showText(text: '你不选择图片打开干啥😤');
    }
  }

  void _pickTextFile() async {
    const label = 'text';
    final XTypeGroup xType = XTypeGroup(label: label, extensions: ['txt']);
    final XFile? file = await openFile(acceptedTypeGroups: [xType]);
    if (file != null) {
      widget.provider.setTitle(file.name);
      final content = await file.readAsString();
      widget.provider.setTextContent(content);
      widget.provider.setFileType(label);
    } else {
      BotToast.showText(text: '打开了个寂寞🙄');
    }
  }

  void _saveTextFile() async {
    final String title = widget.provider.title;
    final String content = widget.provider.txtContent;
    final Uint8List fileData = const Utf8Encoder().convert(content);
// final Uint8List fileData = Uint8List.fromList(content.codeUnits);
    final String? path = await getSavePath(
      acceptedTypeGroups: [
        XTypeGroup(label: '文本', extensions: ['txt']),
      ],
      initialDirectory: r'C:\Users\ilgnefz\Pictures',
      suggestedName: title,
    );
    debugPrint('存储路径：$path');
    if (path != null) {
      const String fileMimeType = 'text/plain';
      final XFile xFile = XFile.fromData(
        fileData,
        mimeType: fileMimeType,
      );
      await xFile.saveTo(path);
    } else {
      BotToast.showText(text: '给你个眼神自己体会😑');
    }
  }

  void _getDir() async {
    final String? path = await getDirectoryPath();
    if (path != null) {
      widget.provider.setTitle('目录');
      widget.provider.setTextContent(path);
      widget.provider.setFileType('text');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Use File Selector'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _pickOneImage,
          child: const Text('选择单张图片'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _pickMultiImage,
          child: const Text('选择多张图片'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _pickTextFile,
          child: const Text('选择文本'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _saveTextFile,
          child: const Text('存储文本'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _getDir,
          child: const Text('读取文件夹路径'),
        ),
      ],
    );
  }
}
