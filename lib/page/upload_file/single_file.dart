import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/providers/upload_file.dart';
import 'package:flutter_desktop_test/widgets/image_decorated.dart';

class SingleFile extends StatelessWidget {
  const SingleFile(this.provider, {Key? key}) : super(key: key);

  final UploadFileProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: ImageDecorated(
              child: Image.file(
                File(provider.file?.path ?? ''),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('名称: ${provider.file?.name}',
                style: const TextStyle(fontSize: 16)),
            Text('大小: ${provider.file?.size}bytes',
                style: const TextStyle(fontSize: 16)),
            Text('后缀: ${provider.file?.extension}',
                style: const TextStyle(fontSize: 16)),
            Text('路径: ${provider.file?.path}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
