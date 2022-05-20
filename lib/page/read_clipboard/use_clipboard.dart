import 'package:flutter/material.dart';

class UseClipboard extends StatelessWidget {
  const UseClipboard({
    Key? key,
    this.onTap0,
    this.onTap1,
    this.onTap2,
    this.onTap3,
  }) : super(key: key);

  final void Function()? onTap0;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTap3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onTap0,
          child: const Text('Ctr + C'),
        ),
        ElevatedButton(
          onPressed: onTap1,
          child: const Text('Ctr + V'),
        ),
        ElevatedButton(
          onPressed: onTap2,
          child: const Text('copy'),
        ),
        ElevatedButton(
          onPressed: onTap3,
          child: const Text('paste'),
        ),
      ],
    );
  }
}
