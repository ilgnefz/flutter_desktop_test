import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AboutMousePage extends StatefulWidget {
  const AboutMousePage({Key? key}) : super(key: key);

  @override
  State<AboutMousePage> createState() => _AboutMousePageState();
}

class _AboutMousePageState extends State<AboutMousePage> {
  String _message = '鼠标未进入';
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (PointerEnterEvent e) {
          // print('platformData: ${e.embedderId}');
          setState(() {
            _message = '鼠标进来了';
          });
        },
        onExit: (PointerExitEvent e) {
          setState(() {
            _message = '鼠标离开了';
            _color = Colors.blue;
          });
        },
        onHover: (PointerHoverEvent e) {
          setState(() {
            _color = Colors.lightBlueAccent;
          });
        },
        cursor: SystemMouseCursors.wait,
        opaque: true,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 300,
          height: 240,
          color: _color,
          alignment: Alignment.center,
          child: Text(_message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
