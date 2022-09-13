import 'package:badges/badges.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/screens/order_history.dart';
import 'package:jebajeba_beta/screens/settings.dart';

import '../custom/route_transitions.dart';
import '../theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
  


      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () => _key.currentState!.openDrawer(),
        //   // icon: SvgPicture.asset("assets/images/menu.svg"),
        //   icon: Icon(CarbonIcons.menu),
        // ),
        centerTitle: true,
        title: Text("Profile"),
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
          IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsPage.routeName);
            },
            icon: const Icon(
              CarbonIcons.settings,
            ),
          )
        ],
      ),
      // drawer: CustomDrawer(),
      body:
      
       ListView(
      
        
        shrinkWrap: true,
        children: [
          userDetails(context),
          topButtons(context),
          SizedBox(
            height: 20,
          ),
          yourOrdersProducts(context),
        ],
      ),
    );
  }
}

Widget userDetails(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    height: height / 4.0,
    width: width,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(
          0.0,
        ),
        bottomRight: Radius.circular(
          0.0,
        ),
      ),
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
          Theme.of(context).brightness == Brightness.dark
              ? kDefaultBlack.withOpacity(0.3)
              : kDefaultWhite.withOpacity(0.3),
          BlendMode.dstATop,
        ),
        image: const AssetImage(
          "assets/images/banner1.jpg",
        ),
        fit: BoxFit.cover,
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? kDarkestGrey
          : kDefaultGrey.withOpacity(0.2),
    ),
    padding: const EdgeInsets.all(10.0),
    child: 
    Column(
      children: [
        Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                height: 87.0,
                width:87.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kBrandMain,
                    width: 2.0,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CircleAvatar(
                    backgroundColor: kBrandLight.withOpacity(0.7),
                    child: const Icon(
                      Icons.person_outline,
                      size: 50.0,
                      color: kDarkestGrey,
                    ),
                  ),
                ),
              ),
              Container(
                height: 35.0,
                width: 35.0,
                decoration: const BoxDecoration(
                  color: kDefaultWhite,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.restorablePushNamed(
                          context, SettingsPage.routeName);
                    },
                    icon: const Icon(
                      CarbonIcons.settings,
                      size: 20.0,
                      color: kDarkestGrey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Welcome, Fadhili",
                  style: const TextStyle(
                    fontSize: 16.0,
                    // color: kDefaultBlack,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.verified_rounded,
                  size: 16.0,
                  color: kBrandMain,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "fadhilipwani@ymail.com",
            style: const TextStyle(
              fontSize: 14.0,
              // color: kDefaultBlack,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ],
    ),
  );
}

Widget topButtons(BuildContext context) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: 20,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Theme.of(context).brightness == Brightness.dark
                      ? kDefaultBlack.withOpacity(0.3)
                      : kDefaultWhite.withOpacity(0.3),
                  Theme.of(context).brightness == Brightness.dark
                      ? kDefaultBlack.withOpacity(0.2)
                      : kDefaultWhite.withOpacity(0.2),
                ],
                    stops: [
                  0.0,
                  1.0
                ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated)),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 40,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black12.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Your Orders",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    )),
              )),
              Expanded(
                  child: Container(
                height: 40,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black12.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Buy again",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
              ))
            ],
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(
              child: Container(
            height: 40,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.black12.withOpacity(0.03),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  "Your Account",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                )),
          )),
          Expanded(
            child: Container(
              height: 40,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black12.withOpacity(0.03),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Your  wishlist",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  )),
            ),
          ),
        ],
      )
    ],
  );
}

Widget yourOrdersProducts(BuildContext context) {
  return Column(
    children: [
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(left: 15.0),
      //       child: Text(
      //         "Recent Orders",
      //         style: TextStyle(
      //           fontSize: 16,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //     ),
      //     InkWell(
      //       onTap: () => ToastNotificationService.showNotification(
      //           "Show all orders ordered by date"),
      //       child: Container(
      //         padding: EdgeInsets.all(10.0),
      //         child: Text(
      //           "See All",
      //           style: TextStyle(
      //             color: kBrandMain,
      //             fontWeight: FontWeight.normal,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      ListTile(
        title: const Text(
          "Order History",
          style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
        ),
        subtitle: const Text(
          "View your order history",
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
        ),
        leading: const Icon(CarbonIcons.analytics),
        trailing: const Icon(Icons.arrow_forward_outlined),
        onTap: () {
          Navigator.push(
            context,
            ScaleRoute(
              page: const OrderHistoryPage(),
            ),
          );
        },
      ),
      ListTile(
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
        ),
        subtitle: const Text(
          "Switch your application preferences",
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
        ),
        leading: const Icon(CarbonIcons.settings),
        trailing: const Icon(Icons.arrow_forward_outlined),
        onTap: () {
          Navigator.restorablePushNamed(context, SettingsPage.routeName);
        },
      ),
      // Container(
      //     height: 170,
      //     padding: EdgeInsets.only(left: 10, top: 20, right: 0.0),
      //     child: ListView.builder(
      //       //itemCount:Itemslist.length,
      //       shrinkWrap: true,
      //       physics: AlwaysScrollableScrollPhysics(),
      //       scrollDirection: Axis.horizontal,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           padding: EdgeInsets.only(left: 0.5, right: 0.5),
      //           child: DecoratedBox(
      //               decoration: BoxDecoration(
      //                   border: Border.all(color: Colors.black12, width: 1.5))),
      //         );
      //       },
      //     ),
      // ),
    ],
  );
}
