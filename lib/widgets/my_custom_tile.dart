import 'package:flutter/material.dart';

class MyCustomTile extends StatelessWidget {
  String title;
  String? subTitle;
  String? trailing;
  IconData? icon;
  VoidCallback onClickEvent;

  MyCustomTile(
      {required this.title,
      this.subTitle,
      this.trailing,
      required this.icon,
      required this.onClickEvent});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClickEvent,
      title: Text(title),
      leading: CircleAvatar(
        child: icon == null? Text(title[0]) : Icon(icon),
      ),
      trailing: Text(trailing ?? ''),
      subtitle: Text(subTitle ?? ''),
    );
  }
}
