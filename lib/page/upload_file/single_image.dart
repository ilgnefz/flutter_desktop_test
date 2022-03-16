import 'dart:io';

import 'package:flutter/material.dart';

class SingleImage extends StatelessWidget {
  const SingleImage(this.path, {Key? key}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Colors.black26),
          ],
        ),
        child: Image.file(
          File(path),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
