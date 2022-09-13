import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  late bool loggedIn;
  late String currentUsername;

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    // checkAuthenticationStatus();
    startTimer();
  }

  // check auth status for the user

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    // check here if the user is logged in (go to home page if logged in, go to registration page if not)
    // String content = '';
    // if (loggedIn) {
    //   content = "You're logged in as '$currentUsername'.";
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
    //} else
    {
      // content =
      //     "You're not logged in. Please create an account or sign in then proceed";

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/jebaicon.jpeg',
                height: 150,
                width: 200,
              ),
            ),
            // Padding(padding: EdgeInsets.only(top: 20.0)),
            // Text(
            //   "Welcome to JebaJeba",
            //   style: TextStyle(fontSize: 30.0, color: Colors.blue,),
            // ),
            // Padding(padding: EdgeInsets.only(top: 20.0)),
            // CircularProgressIndicator(
            //   backgroundColor: Colors.white,
            //  strokeWidth: 1,
            // )
          ],
        ),
      ),
    );
  }
}
