import 'package:flutter/material.dart';

import 'use_system_tray.dart';
import 'use_tray_manager.dart';

class SystemTrayManagerPage extends StatefulWidget {
  const SystemTrayManagerPage({Key? key}) : super(key: key);

  @override
  State<SystemTrayManagerPage> createState() => _SystemTrayManagerPageState();
}

class _SystemTrayManagerPageState extends State<SystemTrayManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('—————————— tray manager ——————————'),
            SizedBox(height: 24),
            UseTrayManagerPage(),
            SizedBox(height: 24),
            Text('—————————— system tray ——————————'),
            SizedBox(height: 24),
            UseSystemTrayPage(),
          ],
        ),
      ),
    );
  }
}
