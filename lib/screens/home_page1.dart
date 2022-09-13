import 'package:badges/badges.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/screens/profile_page.dart';
import 'package:jebajeba_beta/screens/search_page.dart';
import 'package:jebajeba_beta/theme/colors.dart';

import 'cart_page.dart';
import 'home_page.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    // NotificationPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CarbonIcons.home,
                // // color: Colors.black,
              ),
              label: 'Home',
              backgroundColor: Color(0xff40c4ff)),
          BottomNavigationBarItem(
              icon: Icon(
                CarbonIcons.search,
                // // color: Colors.black,
              ),
              label: 'Search',
              backgroundColor: Color(0xff40c4ff)),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     CarbonIcons.notification,
          //     // // color: Colors.black,
          //   ),
          //   label: 'Notifications',
          //   backgroundColor: Color(0xff40c4ff),
          // ),
          BottomNavigationBarItem(
            icon: Badge(
              showBadge: true,
              badgeContent: Text(
                "5",
                style: TextStyle(
                  color: kDefaultWhite,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Icon(
                CarbonIcons.shopping_cart,
                // // color: Colors.black,
              ),
            ),
            label: 'Cart',
            backgroundColor: Color(0xff40c4ff),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CarbonIcons.user,
              // // color: Colors.black,
            ),
            label: 'Profile',
            backgroundColor: Color(
              0xff40c4ff,
            ),
          ),
        ],
      ),
    );
  }
}
