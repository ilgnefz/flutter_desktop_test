import 'package:flutter/material.dart';

class ImageDecorated extends StatelessWidget {
  const ImageDecorated({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 8, color: Colors.black26),
        ],
      ),
      child: child,
    );
  }
}
