import 'package:assignment/pages/list_view.dart';
import 'package:assignment/widgets/my_custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'pages/stack_row.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise',
      home: MyListView(),
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.green),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> userListDrawer = ['Home', 'Favourite', 'About'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      drawer: _myDrawer(context),
      floatingActionButton: _myFloatingActionButton(context),
    );
  }

//CUSTOM_METHOD_HERE
  _myAppBar(BuildContext context) {
    return AppBar(
      title: const Text('YouTube'),
      actions: [
        IconButton(
          onPressed: () {
            Fluttertoast.showToast(msg: 'Search here');
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  _myDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture:
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              accountName: Text('Palash Chandra Das'), accountEmail: Text('palashdasweb2@gmail.com')
          ),
          MyCustomTile(
              title: userListDrawer[0],
              trailing: '14',
              subTitle: 'home',
              onClickEvent: () {}
          ),
          MyCustomTile(
              title: userListDrawer[1],
              onClickEvent: (){
                Navigator.pop(context);
                Fluttertoast.showToast(msg: 'Favourite');
              }
          ),

          MyCustomTile(
              title: userListDrawer[2],
              onClickEvent: (){}),
        ],
      ),
    );
  }

  _myFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Fluttertoast.showToast(msg: 'Floating Action Button');
      },
      child: const Icon(Icons.add_a_photo),
    );
  }
}
