import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MultiImage extends StatelessWidget {
  const MultiImage(this.paths, {Key? key}) : super(key: key);

  final List<String?> paths;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: paths.length,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      crossAxisCount: paths.length > 3 ? 3 : paths.length,
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 8, color: Colors.black26),
            ],
          ),
          child: Image.file(
            File(paths[index]!),
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
