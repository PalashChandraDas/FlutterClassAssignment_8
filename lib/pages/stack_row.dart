import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      body: _myStackBody(context),

    );
  }

  //CUSTOM_METHOD_HERE...
  _myAppBar(BuildContext context) {
    return AppBar(
      title: const Text('StackRow'),
    );
  }

  /*
  _myRowBody(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(height: 100, width: 100, color: Colors.deepOrange),
          Container(height: 100, width: 100, color: Colors.blueGrey),
          SizedBox(height: 100, width: 100, child:CircleAvatar( child: IconButton(onPressed: (){}, icon: Icon(Icons.person)))),
          Container(height: 100, width: 100, color: Colors.deepPurpleAccent),
          Container(height: 100, width: 100, color: Colors.lightGreenAccent),
          Container(height: 100, width: 100, color: Colors.brown),
        ],
      ),
    );
  }
   */

  _myStackBody(BuildContext context) {
    return Stack(
        children: [
          Container(height: 200, width: double.infinity, color: Colors.grey, margin: EdgeInsets.all(10.0),),
          Positioned(
              top: 10,
              left: 10,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
              ),
          Positioned(
              top: 10,
              right: 10,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.star_border))
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined))
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.person))
          )
        ],

    );
  }

}
