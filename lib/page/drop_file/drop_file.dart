import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter_desktop_test/widgets/image_decorated.dart';

class DropFilePage extends StatefulWidget {
  const DropFilePage({Key? key}) : super(key: key);

  @override
  State<DropFilePage> createState() => _DropFilePageState();
}

class _DropFilePageState extends State<DropFilePage> {
  // final List<XFile> files = [];
  // List<File> files = [];
  XFile? file;

  void _dragDone(DropDoneDetails detail) {
    setState(() {
      // files.addAll(detail.files);
      file = detail.files.last;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: _dragDone,
      child: file == null ? uploadImage() : ViewImage(file!),
    );
  }

  Widget uploadImage() {
    return Center(
      child: Container(
        width: 400,
        height: 200,
        decoration: DottedDecoration(
          color: Colors.blue,
          shape: Shape.box,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.image, size: 60, color: Colors.blue),
            SizedBox(height: 8),
            Text(
              '拖动图片打开',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewImage extends StatelessWidget {
  const ViewImage(this.file, {Key? key}) : super(key: key);

  final XFile file;

  Future<Uint8List> _getFile(XFile file) async {
    // print(File(file.path).)
    var bytes = await file.readAsBytes();
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: FutureBuilder(
          future: _getFile(file),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return ImageDecorated(
                child: Image.memory(
                  snapshot.data,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              );
            }
            return Text('图片加载出错了: ${snapshot.error}');
          },
        ),
      ),
    );
  }
}
