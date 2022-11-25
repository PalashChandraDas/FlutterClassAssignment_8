import 'package:assignment/responsive_helper.dart';
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
  double myScreenHeight = 0.0;
  double myScreenWidth = 0.0;

  @override
  void initState() {
    myUserList.add(MyUserModel(userId: '110', userName: 'Palash', userImage: 'https://avatars.githubusercontent.com/u/85504305?v=4'));
    myUserList.add(MyUserModel(userId: '111', userName: 'Nahid', userImage: 'https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/274041944_984633205804296_1286797016439902426_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=174925&_nc_eui2=AeF83gUwZpC8mU2euBWyn7dVTHWVbeY1HDdMdZVt5jUcNxfxmUNEKF4qQfAmWf_6hFABq-x8wd0eMc7wKKinawvG&_nc_ohc=M96TO8OrbOUAX9pVwik&tn=Al6dnYIgmMNGeAg4&_nc_ht=scontent.fdac24-1.fna&oh=00_AfC5TRWksPCLC-0LdSRHIjFfkewCurCbif1Z6XYJ538M7A&oe=63843E6B'));
    myUserList.add(MyUserModel(userId: '112', userName: 'Bayzid'));
    myUserList.add(MyUserModel(userId: '113', userName: 'Rishi Sunak', userImage: 'https://cdn.britannica.com/13/235013-050-18993EB9/Chancellor-of-the-Exchequer-Rishi-Sunak-2022.jpg'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myScreenHeight = MediaQuery.of(context).size.height;
    myScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _myAppBar(context),
      body: _myBody(context ),

    );
  }

  //CUSTOM_METHOD_HERE...
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

  _myBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            /*
            decoration: const BoxDecoration(
              color: Colors.blue,
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
              // border: Border.all(color: Colors.black, width: 1),
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFe9d362),
                  Color(0xFF333333),
                ],
              ),
              image: DecorationImage(
                  image: NetworkImage('https://avatars.githubusercontent.com/u/85504305?v=4'),
                  fit: BoxFit.cover,
              ),
            ),
             */
            child: _activeUserList(),

          ),
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            /*
            decoration: const BoxDecoration(
              color: Colors.blue,
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
              // border: Border.all(color: Colors.black, width: 1),
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFe9d362),
                  Color(0xFF333333),
                ],
              ),
              image: DecorationImage(
                  image: NetworkImage('https://avatars.githubusercontent.com/u/85504305?v=4'),
                  fit: BoxFit.cover,
              ),
            ),
             */
            child: Center(child: Text('Height: $myScreenHeight Width: $myScreenWidth')),

          ),
          gridView(),
          _dynamicListView(context),
        ],
      ),
    );
  }

  gridView(){
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ResponsiveHelper.isMobile(context) ? 2 : ResponsiveHelper.isTab(context) ? 4 : 8,
          
        ),
        itemCount: myUserList.length,
        itemBuilder: (c, i) => Container(
          // padding: EdgeInsets.all(5),
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.all((5.0)),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                // color: Colors.green,
                child: ClipOval(
                  child: CircleAvatar(
                    child: Image.network(myUserList[i].userImage.toString()),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                // color: Colors.red,
                child: Center(child: Text(myUserList[i].userName.toString())),
              ),
            ],
          ),
    ),
    );
  }

  _activeUserList(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: myUserList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 75,
            width: 75,
            margin: EdgeInsets.only(left: 5),
            // color: Colors.yellow,
            child: ClipOval(
              child: CircleAvatar(
                child: Image.network(myUserList[index].userImage.toString()),
              ),
            ),
          );
        },

    );
  }

  _dynamicListView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
