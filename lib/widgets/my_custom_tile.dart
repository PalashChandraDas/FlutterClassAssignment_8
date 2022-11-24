import 'package:flutter/material.dart';

class MyCustomTile extends StatelessWidget{
  String title;
  String? subTitle;
  String? trailing;
  IconData? icon;
  String? imageUrl;
  VoidCallback onClickEvent;
  VoidCallback? longPress;

  MyCustomTile({required this.title, this.subTitle, this.trailing, this.icon, this.imageUrl, required this.onClickEvent, this.longPress});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClickEvent,
      title: Text(title),
      subtitle: Text(subTitle ?? ''),
      trailing: Text(trailing ?? ''),
      onLongPress: longPress,
      /*
        leading: CircleAvatar(
          child: icon == null ? Text(title[0]) : Icon(icon),
        ),
         */
      leading: ClipOval(
        child: CircleAvatar(
          child: imageUrl == null ? Text(title[0]) : Image.network(imageUrl!),
        ),
      ),

    );
  }
}