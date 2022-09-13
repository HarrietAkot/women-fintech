import 'package:flutter/material.dart';
import 'package:jebajeba_beta/theme/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                SizedBox(height: 180),
                Container(
                    child: Text(
                  'Izere Investment Platform',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 22, 100, 202),
                      fontWeight: FontWeight.w800),
                )),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: kBrandMain,
                      ),
                      labelText: 'Username',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: !showPassword,
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: kBrandMain,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: showPassword
                            ? Icon(
                                Icons.visibility_off,
                                color: kBrandMain,
                              )
                            : Icon(
                                Icons.visibility,
                                color: kBrandMain,
                              ),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        color: kBrandMain,
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              child: TextButton(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "/home", (route) => false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: kBrandMain,
                          ),
                        ),
                        onPressed: () {
                          // forgot password - reset account
                          Navigator.pushNamed(context, '/forgot_password');
                        },
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              'Create Account',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 16,
                                color: kBrandMain,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/create_account');

                              //signup screen
                            },
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
