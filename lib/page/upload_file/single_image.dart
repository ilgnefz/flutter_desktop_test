import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/widgets/image_decorated.dart';

class SingleImage extends StatelessWidget {
  const SingleImage(this.path, {Key? key}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ImageDecorated(
        child: Image.file(
          File(path),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
