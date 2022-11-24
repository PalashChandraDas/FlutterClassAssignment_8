import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/my_user_model.dart';
import '../widgets/my_custom_tile.dart';
class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  // var myList = [];
  List<MyUserModel> myUserList = [];

  @override
  void initState() {
    myUserList.add(MyUserModel(userId: '110', userName: 'Palash', userImage: 'https://avatars.githubusercontent.com/u/85504305?v=4'));
    myUserList.add(MyUserModel(userId: '111', userName: 'Nahid', userImage: 'https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/274041944_984633205804296_1286797016439902426_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=174925&_nc_eui2=AeF83gUwZpC8mU2euBWyn7dVTHWVbeY1HDdMdZVt5jUcNxfxmUNEKF4qQfAmWf_6hFABq-x8wd0eMc7wKKinawvG&_nc_ohc=M96TO8OrbOUAX9pVwik&tn=Al6dnYIgmMNGeAg4&_nc_ht=scontent.fdac24-1.fna&oh=00_AfC5TRWksPCLC-0LdSRHIjFfkewCurCbif1Z6XYJ538M7A&oe=63843E6B'));
    myUserList.add(MyUserModel(userId: '112', userName: 'Bayzid'));
    myUserList.add(MyUserModel(userId: '113', userName: 'Krishna', userImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUKEksNC4ud4lt3qf1Ro1DC5OT3C19T1qQ9g&usqp=CAU'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      body: _dynamicListView(context ),

    );
  }

  _myAppBar(BuildContext context) {
    return AppBar(
      title: const Text('ListView'),
      actions: [
        IconButton(onPressed: (){
          setState(() {
            // myList.add('Palash');
            Fluttertoast.showToast(msg: 'Added');
            myUserList.add(MyUserModel(userId: '110', userName: 'Palash', userImage: 'https://avatars.githubusercontent.com/u/85504305?v=4'));
          });
        }, icon: const Icon(Icons.add)),
        IconButton(onPressed: (){
          setState(() {
            // myList.clear();
            myUserList.clear();
            Fluttertoast.showToast(msg: 'Item is empty');
          });
        }, icon: const Icon(Icons.delete)),
      ],
    );
  }

  _dynamicListView(BuildContext context) {
    return ListView.builder(
      itemCount: myUserList.length,
      itemBuilder: (context, index) => MyCustomTile(
        title: myUserList[index].userName??'', imageUrl: myUserList[index].userImage,
        subTitle: myUserList[index].userId,
        longPress: (){
          setState(() {
            myUserList.removeAt(index);
            Fluttertoast.showToast(msg: 'Deleted');
          });
        }, onClickEvent: () { },),
    );
  }



/*
  _listViewSeparatedLocal(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Container(height: 1, color: Colors.grey,),
        itemCount: myList.length,
        itemBuilder: (context, index) => MyCustomTile(
            title: myList[index],
            subTitle: 'I am fine',
            longPress: () => setState(() {
              myList[index] = 'Nahid';
            }),
            onClickEvent: (){
              setState(() {
                myList.removeAt(index);
              });
            }),

    );
  }
   */

/*
  _listViewBuilderLocal(BuildContext context) {
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) => MyCustomTile(
          title: myList[index],
          subTitle: 'How are your?',
          longPress: (){
            setState(() {
              myList[index] = 'Kamal....';
              Fluttertoast.showToast(msg: 'changed');
            });
          },
          onClickEvent: (){
            setState(() {
              myList.removeAt(index);
            });
      }),
    );
  }
   */
}
