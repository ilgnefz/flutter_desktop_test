import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/widgets/title_divider.dart';

import 'use_local_notifier.dart';
import 'use_win_toast.dart';

class SendNotifyPage extends StatelessWidget {
  const SendNotifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
