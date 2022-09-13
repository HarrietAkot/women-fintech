import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Account"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: firstnameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: lastnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Desired Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: kBrandMain,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kBrandMain,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: TextField(
            //     controller: phoneController,
            //     decoration: InputDecoration(
            //       labelText: 'Phone ',
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              color: kBrandMain,
              padding: EdgeInsets.fromLTRB(3, 3, 3, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    child: Text(
                      'Proceed',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () async {
                      if (firstnameController.text.isEmpty ||
                          lastnameController.text.isEmpty ||
                          usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        final snackBar = SnackBar(
                            content: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Icon(Icons.info_outline, color: Colors.amber),
                            ),
                            Expanded(
                              child: Text(
                                  'All fields are mandatory. Please enter all the required information.'),
                            ),
                          ],
                        ));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          // passwords do not match
                          final snackBar = SnackBar(
                              content: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    'Passwords do not match. Please check and try again'),
                              ),
                            ],
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          {
                            final snackBar = SnackBar(
                              duration: Duration(seconds: 3),
                              content: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.check_outlined,
                                      color: kBrandMain,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                        'Your account has been created. Login with your username & password.'),
                                  ),
                                ],
                              ),
                              action: SnackBarAction(
                                label: 'LOGIN',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          {
                            // user already exists.
                            final snackBar = SnackBar(
                              duration: Duration(seconds: 3),
                              content: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.error_outline,
                                        color: Colors.red),
                                  ),
                                  Expanded(
                                    child: Text(
                                        'Sorry, a user with the same username exists. Please login if you aready have an account.'),
                                  ),
                                ],
                              ),
                              action: SnackBarAction(
                                label: 'LOGIN',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          {
                            // failed to create account
                            final snackBar = SnackBar(
                                content: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      'Failed to create your account. Please check and try again'),
                                ),
                              ],
                            ));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }

                      // Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
            TextButton(
              child: Text(
                'Already have an account? Sign In',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: kBrandMain),
              ),
              onPressed: () {
                //login screen
                Navigator.pushNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
