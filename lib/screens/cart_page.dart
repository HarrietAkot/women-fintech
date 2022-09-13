import 'package:badges/badges.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jebajeba_beta/custom/cart_item_tile.dart';
import 'package:jebajeba_beta/models/product.dart';
import 'package:jebajeba_beta/services/toast_service.dart';
import 'package:jebajeba_beta/theme/colors.dart';
import 'package:jebajeba_beta/utils/formatter.dart';
import 'package:jebajeba_beta/utils/utils_list.dart';

import '../constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool loading = false;

  num total = cartProducts.sumBy((Product product) => num.parse(product.price.toString()));

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("My Cart"),
        // leading: IconButton(
        //   onPressed: () => _key.currentState!.openDrawer(),
        //   // icon: SvgPicture.asset("assets/images/menu.svg"),
        //   icon: Icon(CarbonIcons.menu),
        // ),
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
      // drawer: CustomDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 3.0,
            child: loading ? const LinearProgressIndicator() : const Text(""),
          ),
          Expanded(
            // we'll have the hopping cart items here as a scrollable list
            child: cartProducts.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child:
                          Text("Your cart is empty. Please add some products."),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: cartProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = cartProducts[index];
                      return CartItemTile(product: product);
                    },
                  ),
          ),
          Container(
            height: 70.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  kBrandMain.withOpacity(0.05),
                  kBrandMain.withOpacity(0.1),
                  kBrandMain.withOpacity(0.4),
                ],
              ),
            ),
            // we'll have the total overview and the button to checkout here
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "TOTAL:\n$currency ${formatter.format(total)}",
                    style: TextStyle(
                      color: kBrandMain,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.0,
                    height: 45.0,
                    child: ElevatedButton.icon(
                      onPressed: cartProducts.isEmpty || loading
                          ? null
                          : () async {
                              // TODO: check out

                              ToastNotificationService.showSuccessNotification(
                                  "Proceed to checkout");
                            },
                      icon: const Icon(
                        CarbonIcons.shopping_cart,
                        size: 15.0,
                      ),
                      label: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "CHECKOUT",
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: kBrandMain,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
