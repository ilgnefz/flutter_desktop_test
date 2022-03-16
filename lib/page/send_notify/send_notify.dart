import 'package:flutter/material.dart';

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
            SizedBox(height: 24),
            Text('—————————— local notifier ——————————'),
            SizedBox(height: 24),
            UseLocalNotifier(),
            SizedBox(height: 24),
            Text('—————————— win toast ——————————'),
            SizedBox(height: 24),
            UseWinToast(),
          ],
        ),
      ),
    );
  }
}
