import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/page/upload_file/read_text.dart';
import 'package:flutter_desktop_test/page/upload_file/use_file_picker.dart';
import 'package:flutter_desktop_test/page/upload_file/use_file_selector.dart';
import 'package:flutter_desktop_test/providers/upload_file.dart';
import 'package:provider/provider.dart';

import 'multi_image.dart';
import 'single_file.dart';
import 'single_image.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({Key? key}) : super(key: key);

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UploadFileProvider>(context);
    // print();
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: showContent(provider),
          ),
        ),
        Container(
          width: 150,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UseFileSelectorPage(provider),
              UseFilePickerPage(provider),
            ],
          ),
        ),
      ],
    );
  }

  Widget showContent(UploadFileProvider provider) {
    if (provider.fileType == 'image' && provider.filePath != '') {
      return SingleImage(provider.filePath);
    } else if (provider.fileType == 'multiImage' &&
        provider.filePathList.isNotEmpty) {
      return MultiImage(provider.filePathList);
    } else if (provider.fileType == 'text' &&
        (provider.title != '' || provider.txtContent != '')) {
      return ReadText(provider);
    } else if (provider.fileType == 'imageDetail') {
      return SingleFile(provider);
    }
    return const NullState();
  }
}

class NullState extends StatelessWidget {
  const NullState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cat.webp'),
          const SizedBox(height: 12),
          const Text(
            '这里什么都没有😪',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
