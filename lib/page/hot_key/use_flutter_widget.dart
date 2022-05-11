import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UseFlutterWidget extends StatefulWidget {
  const UseFlutterWidget({Key? key}) : super(key: key);

  @override
  State<UseFlutterWidget> createState() => _UseFlutterWidgetState();
}

class _UseFlutterWidgetState extends State<UseFlutterWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CounterShortcuts(
      onIncrementDetected: _increment,
      onDecrementDetected: _decrement,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count', style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _increment, child: const Text('+1')),
                const SizedBox(width: 24),
                ElevatedButton(onPressed: _decrement, child: const Text('-1')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _increment() {
    _count++;
    setState(() {});
  }

  void _decrement() {
    _count--;
    setState(() {});
  }
}

final incrementKey = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.arrowUp,
);

final decrementKey = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.arrowDown,
);

class IncrementIntent extends Intent {}

class DecrementIntent extends Intent {}

class CounterShortcuts extends StatelessWidget {
  const CounterShortcuts({
    Key? key,
    required this.child,
    required this.onIncrementDetected,
    required this.onDecrementDetected,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onIncrementDetected;
  final VoidCallback onDecrementDetected;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      autofocus: true,
      shortcuts: {
        incrementKey: IncrementIntent(),
        decrementKey: DecrementIntent(),
      },
      actions: {
        IncrementIntent: CallbackAction(
          onInvoke: (_) => onIncrementDetected.call(),
        ),
        DecrementIntent: CallbackAction(
          onInvoke: (_) => onDecrementDetected.call(),
        ),
      },
      child: child,
    );
  }
}
