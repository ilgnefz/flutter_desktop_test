import 'package:flutter/material.dart';
import 'package:flutter_desktop_test/page/system_tray_manager/use_system_tray.dart';
import 'package:flutter_desktop_test/widgets/title_divider.dart';

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
            TitleDivider('tray manager'),
            UseTrayManagerPage(),
            TitleDivider('system tray'),
            UseSystemTrayPage(),
          ],
        ),
      ),
    );
  }
}
