import 'package:badges/badges.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/screens/login_page.dart';
import 'package:jebajeba_beta/screens/notifications_page.dart';
import 'package:jebajeba_beta/screens/profile_page.dart';
import 'package:jebajeba_beta/screens/search_page.dart';
import 'package:jebajeba_beta/widgets/clothes_list.dart';
import 'package:jebajeba_beta/widgets/creams_list.dart';
import 'package:jebajeba_beta/widgets/icons_list.dart';
import 'package:jebajeba_beta/widgets/new_clothes.dart';

import '../custom/drawer.dart';
import '../theme/colors.dart';
import '../widgets/header.dart';
import '../widgets/phones_list.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    HomePage(),
    NotificationPage(),
    SearchPage(),
    ProfilePage(),
    SearchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   drawer:OpenDrawer(),
      key: _key,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => _key.currentState!.openDrawer(),
          // icon: SvgPicture.asset("assets/images/menu.svg"),
          icon: Icon(CarbonIcons.menu),
        ),
        centerTitle: true,
        title: Container(
            padding: EdgeInsets.only(right: 130),
            child: Text(
              'Izere Investment',
              style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 22, 100, 202),
                  fontWeight: FontWeight.w500),
            )),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/notifications'),
            icon: Badge(
              showBadge: true,
              badgeContent: Text(
                "10",
                style: TextStyle(
                  color: kDefaultWhite,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Icon(
                CarbonIcons.notification,
              ),
            ),
          ),
        ],
      ),

      drawer: CustomDrawer(),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 180, 222, 235),
                padding: EdgeInsets.only(left: 60),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: [
                      Column(children: [
                        SizedBox(height: 5),
                        Text('Your Balance',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        Text('Shs 60,000',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            )),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 120),
                              child: Column(
                                children: [
                                  Text('Investment',
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  Text('Shs 60,000',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text('Revenue',
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  Text('Shs 266,000',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 40, 0, 10),
                      child: Text(
                        'List of Profitable Ventures',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 40, 0, 10),
                      child: Text('view all',
                          style: TextStyle(color: Colors.blue))),
                ]),
              ),
              Container(
                height: 150,
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    // return ListTile(
                    //   title: Text("Sam's Piggery ${index + 1}"),
                    //   );
                    return Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      color: Color.fromARGB(255, 235, 209, 126),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(30, 5, 160, 5),
                                child: Text(
                                  "Sam's Piggery",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                )),
                            Container(child: Text("details")),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
              Container(
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 40, 160, 10),
                      child: Text('My Investments',
                          style: TextStyle(fontWeight: FontWeight.w900))),
                  Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Text('view all',
                          style: TextStyle(color: Colors.blue))),
                ]),
              ),
              Container(
                color: Colors.grey,
                height: 100,
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    // return ListTile(
                    //   title: Text("Sam's Piggery ${index + 1}"),
                    //   );
                    return InkWell(
                      child: Container(
                        color: Color.fromARGB(255, 166, 241, 104),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(30, 5, 125, 5),
                                child: Column(
                                  children: [
                                    Text(
                                      "Catherine's Bakery",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '01 June 2020',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )),
                            Container(child: Text("Shs 50,000")),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
