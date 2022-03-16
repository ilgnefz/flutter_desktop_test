import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/providers/upload_file.dart';

class ReadText extends StatelessWidget {
  const ReadText(this.provider, {Key? key}) : super(key: key);

  final UploadFileProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(provider.title, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 12),
        Text(provider.txtContent, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
