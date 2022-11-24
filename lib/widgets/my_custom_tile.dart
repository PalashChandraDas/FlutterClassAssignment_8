import 'package:flutter/material.dart';

class MyCustomTile extends StatelessWidget {
  String title;
  String? subTitle;
  String? trailing;
  String? imageUrl;
  VoidCallback onClickEvent;
  VoidCallback? longPress;

  MyCustomTile(
      {super.key, required this.title,
      this.subTitle,
      this.trailing,
      this.imageUrl,
      required this.onClickEvent,
      this.longPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClickEvent,
      title: Text(title),
      leading: ClipOval(
        child: CircleAvatar(
          child: imageUrl == null ? Text(title[0]) : Image.network(imageUrl!),
        ),
      ),
      trailing: Text(trailing ?? ''),
      subtitle: Text(subTitle ?? ''),
      onLongPress: longPress,
    );
  }
}
