/*
* 该插件在pub.dev中标记为[UNIDENTIFIED]
*/
// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart' hide MenuItem;
// import 'package:native_context_menu/native_context_menu.dart';
//
// class UseNativeContextMenu extends StatelessWidget {
//   const UseNativeContextMenu({Key? key}) : super(key: key);
//
//   final String _text = '''宇宙是一片无垠大海。
// 传说这大海的构成，三分之二是孤独，三分之一是梦想。
// 当“歌族”的地平线被第一道光照亮的时候，那些拥有名为“灵”的种子的孩子们启程。
// 以音为帆，以歌为筏，以真作舵，以梦载风。洋流下面藏着暗礁千仞，飓风后面掩着碧空万里，迷雾剥开是一片崭新的大陆，深渊褪去是沉睡千年的遗迹
// 有一个从未歌唱过的孩子，把旅途的感悟谱成了曲子，在无边星空下她悠悠唱着：
// “当我意识到自己的渺小，
// 这一瞬间我才终于知道，
// 我就是我，我独一无二，
// 我是自己最大的财富，我守望着生命的骄傲。”
// 《蚍蜉渡海》包括了由银临作曲的十首新作，和《不老梦》的弦乐实录的重制版。编曲主要由老搭档灰原穷完成，同时也邀请了天钦、小龙龙、印iAn三位好友共同创作，碰撞新的火花。
// 作词方面，这张专辑由词作的亲身感悟出发，开启一段如梦般的旅程。有至死不渝的不朽之梦，有不可言说的暗恋之梦，有废墟站起的挣扎之梦，有一瞬一生的凄婉之梦，也有物我两忘的迷离之梦。用音乐去感知，用故事去发掘蕴藏于每个人内心的敏感和追寻。
// 曲风也融入更多样的形式，不拘一格，又古韵十足。无论是在歌曲创作上，还是在题材选择和演唱方式上，《蚍蜉渡海》都做到了打破传统、挑战自我，让听众们感到耳目一新。''';
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ContextMenuRegion(
//           onDismissed: () => BotToast.showText(text: '你没有选择任何选项'),
//           onItemSelected: (item) =>
//               BotToast.showText(text: '你选中了${item.title}'),
//           menuItems: [
//             MenuItem(title: '全选'),
//             MenuItem(
//               title: '复制',
//               // onSelected: () => BotToast.showText(text: '复制成功'),
//               // action: {'title': '标题'},
//             ),
//             MenuItem(title: '剪切'),
//             MenuItem(title: '粘贴'),
//             MenuItem(
//               title: '举报',
//               items: [
//                 MenuItem(title: '发邮箱'),
//                 MenuItem(title: '打电话'),
//               ],
//             ),
//           ],
//           child: Text(_text, style: const TextStyle(height: 1.5)),
//         ),
//       ),
//     );
//   }
// }
