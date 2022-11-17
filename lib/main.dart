import 'package:assignment/widgets/my_custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<String> userListDrawer = ['Home', 'Profile', 'Favourite'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _myDrawer(context),
      appBar: _myAppBar(context),
      body: _myBody(context),
      floatingActionButton: _myFloatingActionButton(context),
    );
  }

//CUSTOM_METHOD_HERE...
  _myDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
              accountName: Text('Palash Chandra Das'),
              accountEmail: Text('palashdasweb2@gmail.com')),
          MyCustomTile(
              title: userListDrawer[0],
              icon: Icons.home,
              onClickEvent: () {
                Fluttertoast.showToast(msg: 'Home');
              }),
          MyCustomTile(
            title: userListDrawer[1],
            icon: null,
            onClickEvent: () {
              Navigator.pop(context);
              Fluttertoast.showToast(msg: 'Profile');
            },
            subTitle: 'my profile',
            trailing: '10',
          ),
        ],
      ),
    );
  }

  _myAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
      actions: [
        IconButton(
            onPressed: () {
              Fluttertoast.showToast(msg: 'Upcoming feature');
            },
            icon: const Icon(Icons.search))
      ],
    );
  }

  _myBody(BuildContext context) {
    return Container();
  }

  _myFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Fluttertoast.showToast(msg: 'add');
        // print('Clicked');
      },
      child: const Icon(Icons.add),
    );
  }
}
