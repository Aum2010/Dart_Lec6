import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Home Page"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //               auth.signOut();
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        drawer: Drawer(
            child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu2'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                    // Navigator.pushNamed(context, routeName)
                  }),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        )),
        body: Container(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text("Hello", style: TextStyle(fontSize: 26)),
        ]))));
  }
}
