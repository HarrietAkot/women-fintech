import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/models/product.dart';
import 'package:jebajeba_beta/theme/colors.dart';

import '../constants.dart';
import '../screens/product_details.dart';
import '../services/toast_service.dart';
import '../utils/formatter.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // color: kBrandLight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      width: 200,
                      height: 100,
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
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "$currency ${product.price.toString()}",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    product.description ?? "",
                    style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextButton(
                      onPressed: () {
                        ToastNotificationService.showSuccessNotification(
                            "Added to cart");
                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: kDefaultWhite,
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding:  EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: Constants.kpadding,
                        ),
                        backgroundColor: kBrandAccent,
                        // primary: kDefaultWhite,
                        minimumSize: Size(5, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: product),
              ),
            );
          },
        ),
      ),
    );
  }
}
