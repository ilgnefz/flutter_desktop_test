import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  const CustomTooltip({Key? key}) : super(key: key);

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  Role role = Role(name: '海绵宝宝', city: '比奇堡', age: 36, position: '蟹堡王餐厅的高级厨师');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        richMessage: WidgetSpan(
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('姓名：${role.name}'),
                Text('地址：${role.city}'),
                Text('年龄：${role.age}'),
                Text('职位：${role.position}'),
              ],
            ),
          ),
        ),
        // margin: const EdgeInsets.only(left: 250 * 2 - (250 - 200) / 2),
        verticalOffset: 817 * 250 / 806 / 2,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(.2))
          ],
        ),
        // textStyle: const TextStyle(color: Colors.black),
        // waitDuration: const Duration(seconds: 2),
        // showDuration: const Duration(seconds: 2),
        child: DecoratedBox(
            decoration: const BoxDecoration(
                // border: Border.all(width: 1, color: Colors.black),
                ),
            child: Image.asset('assets/images/hmbb.png', width: 250)),
      ),
    );
  }
}

class Role {
  final String name;
  final String city;
  final int age;
  final String position;

  Role({
    required this.name,
    required this.city,
    required this.age,
    required this.position,
  });
}
