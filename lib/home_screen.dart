import 'package:assignment/models/my_user_model.dart';
import 'package:assignment/widgets/my_custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomePage> {
  var title = '';
  List<MyUserModel> myList = [];

  // bool sort = false;

  @override
  void initState() {
    title = 'Home Page';
    myList.add(MyUserModel(userId: '110', userName: 'Palash', userImage: 'https://avatars.githubusercontent.com/u/85504305?v=4'));
    myList.add(MyUserModel(userId: '111', userName: 'Krishna'));
    myList.add(MyUserModel(userId: '222', userName: 'Nahid', userImage: 'https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/274041944_984633205804296_1286797016439902426_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=174925&_nc_eui2=AeF83gUwZpC8mU2euBWyn7dVTHWVbeY1HDdMdZVt5jUcNxfxmUNEKF4qQfAmWf_6hFABq-x8wd0eMc7wKKinawvG&_nc_ohc=M96TO8OrbOUAX9pVwik&tn=Al6dnYIgmMNGeAg4&_nc_ht=scontent.fdac24-1.fna&oh=00_AfC5TRWksPCLC-0LdSRHIjFfkewCurCbif1Z6XYJ538M7A&oe=63843E6B'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      body: _listViewBuilderOrDynamicListView(context),
    );
  }

  _myAppBar(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                // myList.add('');
                myList.add(MyUserModel(userId: '110', userName: 'Palash', userImage: 'https://avatars.githubusercontent.com/u/85504305?v=4'));
              });
            },
            icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              setState(() {
                myList.clear();
              });
            },
            icon: const Icon(Icons.delete)),
        IconButton(
            onPressed: () {
              setState(() {
                // sort = !sort;
              });
            },
            icon: const Icon(Icons.sort)),
      ],
    );
  }

  // _listViewSeparatedOrDynamicListView(BuildContext context) {
  //   return ListView.separated(
  //
  //     separatorBuilder: (context, index) => Container(height: 1, color: Colors.grey),
  //     itemCount: myList.length,
  //     itemBuilder: (context, index) {
  //       return MyCustomTile(
  //         title: myList[index].userName??'',
  //         icon: null,
  //         onClickEvent: () {
  //           setState(() {
  //             myList.removeAt(index);
  //           });
  //           Fluttertoast.showToast(msg: '${myList[index]} has been deleted');
  //         },
  //         subTitle:'10 min ago',
  //         longPress: () {
  //           setState(() {
  //             // myList[index] = 'Krishna';
  //           });
  //           Fluttertoast.showToast(msg: '${myList[index]} long pressed');
  //         },
  //       );
  //     },
  //     // reverse: sort,
  //   );
  // }

  _listViewBuilderOrDynamicListView(BuildContext context) {
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return MyCustomTile(
          title: myList[index].userName ?? '', imageUrl: myList[index].userImage, onClickEvent: () {
            Fluttertoast.showToast(msg: '${myList[index]} has been deleted');
            setState(() {
              myList.removeAt(index);
            });
          },
          subTitle: '10 min ago',
          longPress: () {
            setState(() {
              // myList[index] = 'Krishna';
            });
            Fluttertoast.showToast(msg: '${myList[index]} long pressed');
          },
        );
      },
    );
  }
}
