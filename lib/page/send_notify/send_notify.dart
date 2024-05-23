import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/widgets/title_divider.dart';

import 'use_local_notifier.dart';
import 'use_win_toast_old.dart';

class SendNotifyPage extends StatelessWidget {
  const SendNotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleDivider('local notifier'),
            UseLocalNotifier(),
            TitleDivider('win toast'),
            UseWinToast(),
          ],
        ),
      ),
    );
  }
}
