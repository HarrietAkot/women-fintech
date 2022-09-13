import 'package:flutter/material.dart';

class OpenDrawer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            // this to prevent the default sliding behaviour
            drawerEnableOpenDragGesture: false,
            drawer: Drawer(),
            appBar: AppBar(
              leading: Builder(
                builder: (context) => // Ensure Scaffold is in context
                    IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () => Scaffold.of(context).openDrawer()),
              ),
            )));
  }
}
