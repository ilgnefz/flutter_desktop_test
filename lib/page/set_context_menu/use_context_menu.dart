import 'package:bot_toast/bot_toast.dart';
import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';

import 'set_context_menu.dart';

class UseContextMenu extends StatelessWidget {
  const UseContextMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContextMenuOverlay(
      // cardBuilder: (_, children) => Container(
      //   color: Colors.lightBlueAccent,
      //   child: Column(children: children),
      // ),
      // buttonBuilder: (_, config, [__]) => TextButton(
      //   onPressed: config.onPressed,
      //   child: Text(
      //     '${config.label} - 银临',
      //   ),
      // ),
      dividerBuilder: (context) =>
          Container(height: 2, width: double.maxFinite, color: Colors.blue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContextMenuRegion(
            contextMenu: const LinkContextMenu(url: cmImage),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 800,
                  maxHeight: 450,
                ),
                child: Image.network(cmImage),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const ContextMenuRegion(
            contextMenu: TextContextMenu(data: cmTitle),
            child: Text(cmTitle, style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(height: 12),
          ContextMenuRegion(
            contextMenu: GenericContextMenu(
              buttonConfigs: List.generate(
                cmSongs.length,
                (index) => ContextMenuButtonConfig(
                  cmSongs[index],
                  onPressed: () =>
                      BotToast.showText(text: '播放${cmSongs[index]}'),
                  shortcutLabel: 'ctrl+F${index + 1}',
                  icon: const Icon(Icons.album, size: 18),
                  iconHover:
                      const Icon(Icons.play_circle_fill_rounded, size: 18),
                ),
              ).toList(),
            ),
            child: const Text('歌曲列表'),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
