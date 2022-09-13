import 'package:flutter/material.dart';
import 'package:jebajeba_beta/theme/colors.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
                reverse: true,
                child: Column(children: [
                  SizedBox(height: 180),
                  Container(
                      child: Text(
                    'Izere Investment Platform',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 22, 100, 202),
                        fontWeight: FontWeight.w800),
                  )),
                  Container(
                      child: Column(children: [
                    Container(
                      child: Text(
                        "Please enter the e-mail address associated with your\nIzere Investment Account.\nWe will send you a link that you'll use to reset your password",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: kBrandMain,
                          ),
                          labelText: 'Email Address',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        color: kBrandMain,
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                  child: Text(
                                    'Reset Password',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            child: Text(
                                              'Already have an account? Sign in.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              // sign up screen
                                              Navigator.pushNamed(
                                                  context, '/login');
                                            },
                                          ),
                                          SizedBox(
                                            width: 50.0,
                                          ),
                                          Container(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              TextButton(
                                                child: Text(
                                                  'Create Account',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: kBrandMain),
                                                ),
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      '/create_account');

                                                  //signup screen
                                                },
                                              )
                                            ],
                                          )),
                                        ],
                                      ),
                                    );
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: TextButton.icon(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: kBrandMain,
                                          ),
                                          label: Text("Go Back",
                                              style: TextStyle(
                                                  color: kBrandMain,
                                                  fontSize: 15)),
                                        ));
                                  })
                            ]))
                  ]))
                ]))));
  }
}
