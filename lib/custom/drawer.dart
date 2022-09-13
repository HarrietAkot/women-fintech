import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/screens/settings.dart';
import 'package:jebajeba_beta/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

import '../screens/categories_page.dart';
import '../screens/splash_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: kBrandMain,
                child: Center(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(top: 30, bottom: 10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kDefaultWhite,
                          ),
                          child: Icon(
                            CarbonIcons.user_activity,
                            size: 35.0,
                            color: kBrandMain,
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, SettingsPage.routeName),
                      ),
                      Text(
                        "fadhili Rimba",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        "fadhilipwani@ymail.com",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.blue[700],
            ),
            title: Text(
              "Property Listing",
              style: TextStyle(
                // color: Color(0xFF40C4FF),
                color: Colors.blue[700],
              ),
            ),
          ),
          ExpansionTile(
            leading: Icon(
              CarbonIcons.agriculture_analytics,
              color: Colors.blue[700],
            ),
            title: Text(
              "Fresh to you",
              style: TextStyle(
                // color: Color(0xFF40C4FF),
                color: Colors.blue[700],
              ),
            ),
            // expansion tile categories
            children: [
              ListTile(
                title: Text(
                  "Dairy",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // subtitle: Text("Dairy products"),
                leading: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kBrandLight
                        : Colors.transparent,
                  ),
                  width: 30.0,
                  height: 30.0,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1550583724-b2692b85b150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWlsa3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
                    height: 15.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade600,
                          child: const Icon(CarbonIcons.image),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Icon(CarbonIcons.no_image),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesPage(
                        title: "Dairy",
                        products: allProducts
                            .where((product) => product.category
                                .toLowerCase()
                                .contains("Dairy".toLowerCase()))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Meat",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // subtitle: Text("Meat products"),
                leading: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kBrandLight
                        : Colors.transparent,
                  ),
                  width: 30.0,
                  height: 30.0,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1613454320437-0c228c8b1723?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVlZnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
                    height: 15.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade600,
                          child: const Icon(CarbonIcons.image),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Icon(CarbonIcons.no_image),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesPage(
                        title: "Meat",
                        products: allProducts
                            .where((product) => product.category
                                .toLowerCase()
                                .contains("Meat".toLowerCase()))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Drinks",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // subtitle: Text("Drinks products"),
                leading: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kBrandLight
                        : Colors.transparent,
                  ),
                  width: 30.0,
                  height: 30.0,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80",
                    height: 15.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade600,
                          child: const Icon(CarbonIcons.image),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Icon(CarbonIcons.no_image),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesPage(
                        title: "Drinks",
                        products: allProducts
                            .where((product) => product.category
                                .toLowerCase()
                                .contains("Drinks".toLowerCase()))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Ready to Eat",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // subtitle: Text("Ready to Eat products"),
                leading: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kBrandLight
                        : Colors.transparent,
                  ),
                  width: 30.0,
                  height: 30.0,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1694&q=80",
                    height: 15.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade600,
                          child: const Icon(CarbonIcons.image),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Icon(CarbonIcons.no_image),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesPage(
                        title: "Ready to Eat",
                        products: allProducts
                            .where((product) => product.category
                                .toLowerCase()
                                .contains("Ready to Eat".toLowerCase()))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.generating_tokens,
              color: Colors.blue[700],
            ),
            title: Text("Geek squad",
                style: TextStyle(
                  color: Colors.blue[700],
                )),
          ),

          ListTile(
            leading: Icon(
              Icons.airplane_ticket,
              color: Colors.blue[700],
            ),
            title: Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'B',
                      style: TextStyle(color: Colors.green),
                    ),
                    TextSpan(
                      text: 'o',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: 'o',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: 'k',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: 's',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: '/',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Tickets',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.food_bank,
              color: Colors.blue[700],
            ),
            title: Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'jeba',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: 'e',
                      style: TextStyle(color: Colors.green),
                    ),
                    TextSpan(
                      text: 'a',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: 't',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: 's',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.sports_gymnastics,
              color: Colors.red[700],
            ),
            title: Text("Fitness",
                style: TextStyle(
                  color: Colors.red[700],
                )),
          ),

          ListTile(
            leading: Icon(
              Icons.camera,
              color: Colors.blue[700],
            ),
            title: Text("Digital Products",
                style: TextStyle(
                  color: Colors.blue[700],
                )),
          ),

          ListTile(
            leading: Icon(
              Icons.list_alt,
              color: Colors.blue[700],
            ),
            title: Text("Electronics",
                style: TextStyle(
                  color: Colors.blue[700],
                )),
          ),

          ExpansionTile(
              leading: Icon(
                Icons.dashboard,
                color: Colors.blue[700],
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.blue[700],
                ),
              ),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.baby_changing_station,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Baby",
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.man_sharp,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Men",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.woman_sharp,
                color: Colors.blue[700],
                  ),
                  title: Text(
                    "Women",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.electric_bolt_outlined,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Electronics",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.gamepad,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Gaming",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.sports,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Sports",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.toys,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Toys and Games",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Phones and Tablets",
                    style: TextStyle(
                         color: Colors.blue
                        ),
                  ),
                ),
              ]),
          ExpansionTile(
              leading: Icon(
                Icons.beach_access,
                color: Colors.blue[700],
              ),
              title: Text(
                "Beauty and Personal Care",
                style: TextStyle(
                  color: Colors.blue[700],
                ),
              ),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.face_retouching_natural_rounded,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Fragrance",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.cut,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Hair Care",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.face_outlined,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Make up",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.health_and_safety_rounded,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Oral care",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.cut_sharp,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Shave and Hair Removal",
                    style: TextStyle(
                         color: Colors.blue),
                        
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.touch_app,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Skin Care",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                ListTile(
                
                  leading: Icon(
                    Icons.graphic_eq,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Tools and Accessories",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ]),
          ExpansionTile(
            leading: Icon(
              Icons.art_track,
              color: Colors.blue[700],
            ),
            title: Text(
              "Art and Craft",
              style: TextStyle(
                color: Colors.blue[700],
              ),
            ),
            children: [
              ListTile(
                leading: Icon(
                  Icons.center_focus_strong_rounded,
                  color: Colors.blue[700],
                ),
                title: Text(
                  "Knitting and Crotchet",
                  style: TextStyle(
                    color: Colors.blue[700],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.draw_outlined,
                  color: Colors.blue[700],
                ),
                title: Text(
                  "Painting ,Drawing,Art supplies",
                  style: TextStyle(
                    color: Colors.blue[700],
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.family_restroom,
              color: Colors.blue[700],
            ),
            title: Text(
              "Fashion",
              style: TextStyle(
                color: Colors.blue[700],
              ),
            ),
            children: [
              ListTile(
                leading: Icon(
                  Icons.woman_outlined,
                  color: Colors.blue[700],
                ),
                title: Text(
                  "Women's  Fashion",
                  style: TextStyle(
                    color: Colors.blue[700],
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(
                    Icons.man_outlined,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Mens Fashion",
                    style: TextStyle(color: Colors.blue,)),
                  ),
              ListTile(
                leading: Icon(
                  Icons.girl_outlined,
                    color: Colors.blue[700],
                ),
                title: Text(
                  "Girls Fashion",
                  style: TextStyle(
                      color: Colors.blue),
                      ),
                ),
              
              ListTile(
                leading: Icon(
                  Icons.boy_outlined,
                 color: Colors.blue[700],
                ),
                title: Text(
                  "Boys Fashion",
                  style: TextStyle(
                      color: Colors.blue,
                      ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.health_and_safety,
              color: Colors.blue[700],
            ),
            title: Text(
              "Health and Household",
              style: TextStyle(
                color: Colors.blue[700],
              ),
            ),
            children: [
              ListTile(
                leading: Icon(
                  Icons.baby_changing_station,
                  color: Colors.blue[700],
                ),
                title: Text(
                  "Baby and Child care",
                  style: TextStyle(
                    color: Colors.blue[700],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.healing,
                   color: Colors.blue,
                ),
                title: Text(
                  "Oral Care",
                  style: TextStyle(
                  color: Colors.blue[700],

                      ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.hot_tub_sharp,
                 color: Colors.blue,
                ),
                title: Text(
                  "Sexual Wellness",
               style: TextStyle(
                    color: Colors.blue[700],
                      ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.sports_gymnastics_rounded,
                   color: Colors.blue,
                ),
                title: Text(
                  "Sports Nutrition",
                 style: TextStyle(
                    color: Colors.blue[700],
                      ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.visibility,
                   color: Colors.blue,
                ),
                title: Text(
                  "Vision Care",
                  style: TextStyle(
                     color: Colors.blue[700]
                      ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.food_bank,
                  color: Colors.blue
                ),
                title: Text(
                  "Vitamins and Dietry Supplements",
                  style: TextStyle(
                     color: Colors.blue[700]
                      ),
                ),
              ),
            ],
          ),
          // ExpansionTile(
          //   leading: Icon(Icons.home),
          //   title: Text("Home and Kitchen"),
          //   children: [
          //     ListTile(
          //       leading: Icon(Icons.access_alarm),
          //       title: Text("Bedding"),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.access_alarm),
          //       title: Text("Cleaning Supplies"),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.access_alarm),
          //       title: Text("Kitchen and Dining"),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.access_alarm),
          //       title: Text("Seasonal Decor "),
          //     ),
          //   ],
          //),
          ExpansionTile(
            leading: Icon(
              Icons.dining,
              color: Colors.blue[700],
            ),
            title: Text(
              "Supermarket",
              style: TextStyle(
                color: Colors.blue[700],
              ),
            ),
            children: [
              ListTile(
                leading: Icon(
                  Icons.child_friendly_rounded,
                 color: Colors.blue,
                ),
                title: Text("Baby Products",style: TextStyle(
                color: Colors.blue[700],
              ),),
              ),
              ListTile(
                leading: Icon(
                  Icons.cleaning_services,
                  
                 color: Colors.blue,
                ),
                title: Text("Cleaning",
                style: TextStyle(
                color: Colors.blue[700],
              ),),
              ),
              ListTile(
                leading: Icon(
                  Icons.food_bank,
                 color: Colors.blue,
                ),
                title: Text("Food",
                style: TextStyle(
                color: Colors.blue[700],
              ),),
              ),
              ListTile(
                leading: Icon(
                  Icons.discount,
                 color: Colors.blue,
                ),
                title: Text("Boys Fashion",
                style: TextStyle(
                color: Colors.blue[700],
              ),),
              ),
             
            ],
          ),
            ListTile(
              onTap: () {
               Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ),
    );
              },
              
                  leading: Icon(
                    Icons.logout,
                    color: Colors.blue[700],
                  ),
                  title: Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
