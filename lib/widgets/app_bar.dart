import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';

AppBar buildAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          // color: Colors.black,
        ),
      ),
      title: Image.asset(
        "assets/images/jebaicon.jpeg",
        height: 25,
      ),
      actions: [
        Padding(
          padding:  EdgeInsets.all(Constants.kpadding),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        )
      ],
    );
