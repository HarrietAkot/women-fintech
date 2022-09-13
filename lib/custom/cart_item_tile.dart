import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/custom/cart_item_manager.dart';
import 'package:jebajeba_beta/models/product.dart';
import 'package:jebajeba_beta/screens/product_details.dart';
import 'package:jebajeba_beta/theme/colors.dart';
import 'package:jebajeba_beta/utils/formatter.dart';

import '../services/toast_service.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 150,
          width: width,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        product: product,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  height: 150,
                  width: width / 3.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          child: Icon(CarbonIcons.image_search),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: SizedBox(
                          child: Icon(CarbonIcons.no_image),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          // color: kBrandMain,
                        ),
                      ),
                      CartItemManager(product: product),
                      Text(
                        "$currency ${formatter.format(product.price)} x2",
                        style: const TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "$currency ${formatter.format(product.price * 2)}",
                        style: const TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: kBrandMain,
                        ),
                      ),
                      product.stockStatus == "outofstock"
                          ? Text(
                              'This product is currently not available for purchase.',
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.red.shade600,
                                fontStyle: FontStyle.italic,
                              ),
                              maxLines: 3,
                            )
                          : const Text(''),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        CarbonIcons.trash_can,
                        color: Colors.red.shade700,
                      ),
                    ),
                    onPressed: () {
                      // TODO: remove items from cart
                      ToastNotificationService.showErrorNotification(
                          "Removed all '${product.name}' products from the cart.");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
