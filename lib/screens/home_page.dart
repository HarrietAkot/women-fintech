import 'package:badges/badges.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
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
            child: Text(
          'Izere Investment Platform',
          style: TextStyle(
              fontSize: 20,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 100),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 170),
                  child: Row(
                    children: [
                      Column(children: [
                        SizedBox(height: 5),
                        Text('Wallet Balance',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text('Shs 60,000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text('Wallet Balance',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                  Text('Wallet Balance',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('Shs 60,000',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
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
              ImageCarousel(),
              // buildHeader(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Constants.kpadding,
                    horizontal: Constants.kpadding * 2),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              buildIconsList(context),
              BuildClothesList(),
              BuildNewClothes(),
              BuildPhonesList(),
              BuildCreamsList()
            ],
          ),
        ),
      ),
    );
  }
}
