import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/page/set_context_menu/use_%20contextual_menu.dart';
import 'package:flutter_desktop_test/page/set_context_menu/use_context_menu.dart';
import 'package:flutter_desktop_test/page/set_context_menu/use_desktop_context_menu.dart';

import 'use_contextmenu.dart';

const String cmImage =
    'https://bkimg.cdn.bcebos.com/pic/21a4462309f790529822c43462b9c0ca7bcb0a467f2c?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UyNzI=,g_7,xp_5,yp_5/format,f_auto';
const String cmTitle = '蚍蜉渡海';
final List<String> cmSongs = ['裁梦为魂', '如一', '不老梦', '是风动', '卑微情书'];

class SetContextMenuPage extends StatefulWidget {
  const SetContextMenuPage({Key? key}) : super(key: key);

  @override
  State<SetContextMenuPage> createState() => _SetContextMenuPageState();
}

class _SetContextMenuPageState extends State<SetContextMenuPage> {
  final List<Widget> _children = const [
    UseContextMenu(),
    UseContextmenu(),
    // UseNativeContextMenu(),
    UseDesktopContextMenu(),
    UseContextualMenu(),
  ];

  final List<String> _titles = [
    'context_menus',
    'contextmenus',
    // 'native_context_menu',
    'desktop_context_menu',
    'contextual_menu',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: IndexedStack(children: _children, index: _current)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _titles.length,
              (index) => ElevatedButton(
                  child: Text(_titles[index]),
                  onPressed: _current == index
                      ? null
                      : () {
                          _current = index;
                          setState(() {});
                        }),
            ),
          ),
        ),
      ],
    );
  }
}
