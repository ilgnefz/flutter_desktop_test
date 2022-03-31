import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/page/set_context_menu/use_context_menu.dart';

import 'use_contextmenu.dart';
import 'use_native_context_menu.dart';

const String cmImage =
    'https://gitee.com/ilgnefz/image-house/raw/master/images/202203231144213.jpeg';
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
    UseNativeContextMenu(),
  ];

  final List<String> _titles = [
    'context_menus',
    'contextmenus',
    'native_context_menu',
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
