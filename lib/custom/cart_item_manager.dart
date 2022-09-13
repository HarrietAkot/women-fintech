import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/models/product.dart';

import '../services/toast_service.dart';
import '../theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemManager extends StatelessWidget {
  final Product product;
  final double? iconSize;

  const CartItemManager({
    Key? key,
    required this.product,
    this.iconSize,
  }) : super(key: key);

  // does item exist in cart?
  bool itemExists(Product product) {
    int i =
        cartProducts.indexWhere((Product element) => element.id == product.id);

    if (i <= -1) {
      // doesn't exist
      return false;
    } else {
      // exists
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool inStock = product.stockStatus == "instock" ||
        product.stockStatus == "onbackorder" ||
        (product.stockQuantity != null && product.stockQuantity! > 0);
    return Container(
      child: inStock
          ? SizedBox(
              width: width / 2.5,
              child: itemExists(product)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: kBrandAccent.withOpacity(0.4),
                          color: Colors.transparent,
                        ),
                        width: width / 2.5,
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                // TODO: add item to cart
                                ToastNotificationService.showErrorNotification(
                                    "Removed 1 ${product.name} from cart...");
                              },
                              icon: Icon(
                                CarbonIcons.subtract,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "2",
                              style: const TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold
                                  // color: kBrandMain,
                                  ),
                            ),
                            IconButton(
                              onPressed: () {
                                // TODO: add item to cart
                                ToastNotificationService
                                    .showSuccessNotification(
                                        "Added 1 ${product.name} to cart...");
                              },
                              icon: Icon(
                                CarbonIcons.add,
                                color: kBrandMain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () {
                          // TODO: add item to cart
                          ToastNotificationService.showSuccessNotification(
                              "Added ${product.name} to cart...");
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 14.0,
                          color: kDefaultWhite,
                        ),
                        label: Text(
                          "ADD TO CART",
                          style: TextStyle(
                            fontSize: 12,
                            color: kDefaultWhite,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.lexendDeca().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        style: TextButton.styleFrom(
                          primary: kBrandMain,
                          backgroundColor: kBrandMain,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Center(
                  child: Text(
                    "UNAVAILABLE",
                    style: TextStyle(
                      color: Colors.red.shade800,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
    );
  }
}
