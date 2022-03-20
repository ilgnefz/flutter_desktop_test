import 'package:flutter/material.dart';

class TitleDivider extends StatelessWidget {
  const TitleDivider(this.title, {this.top, this.bottom, Key? key})
      : super(key: key);

  final String title;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top ?? 24, bottom: bottom ?? 16),
      child: Text('—————————— $title ——————————'),
    );
  }
}
