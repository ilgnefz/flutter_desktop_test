import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/providers/upload_file.dart';

class UseFilePickerPage extends StatefulWidget {
  const UseFilePickerPage(this.provider, {Key? key}) : super(key: key);

  final UploadFileProvider provider;

  @override
  State<UseFilePickerPage> createState() => _UseFilePickerPageState();
}

class _UseFilePickerPageState extends State<UseFilePickerPage> {
  void _pickSingleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: '我的地盘我做主',
      initialDirectory: r'C:\Users\ilgnefz\Desktop',
      type: FileType.image,
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      widget.provider.setFilePath(file.path);
      widget.provider.setFileType('image');
    }
  }

  void _pickMultiFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      final List<String> paths = result.files.map((e) => e.path!).toList();
      widget.provider.setFilePathList(paths);
      widget.provider.setFileType('multiImage');
    }
  }

  void _pickFileDetail() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.single;
      // print(file);
      widget.provider.setFile(file);
      widget.provider.setFileType('imageDetail');
    }
  }

  void _saveFile() async {
    String? outputFile =
        await FilePicker.platform.saveFile(fileName: 'hello.txt');
    if (outputFile != null) {
      File file = File(outputFile);
      await file.writeAsString('Hello World');
      await file.create();
      BotToast.showText(text: '文件存储成功');
    }
  }

  void _pickDir() async {
    String? dir = await FilePicker.platform.getDirectoryPath();
    if (dir != null) {
      widget.provider.setTitle('目录');
      widget.provider.setTextContent(dir);
      widget.provider.setFileType('text');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Use File Picker'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _pickSingleFile,
          child: const Text('选择单个文件'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _pickMultiFile,
          child: const Text('选择多个文件'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _pickFileDetail,
          child: const Text('读取文件信息'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _saveFile,
          child: const Text('存储文件'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _pickDir,
          child: const Text('选择文件夹路径'),
        ),
      ],
    );
  }
}
