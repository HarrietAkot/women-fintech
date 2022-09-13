import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/models/product.dart';
import 'package:jebajeba_beta/utils/formatter.dart';
import 'package:shimmer/shimmer.dart';

import '../custom/cart_item_manager.dart';
import '../theme/colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: height / 2.5,
            titleSpacing: 2.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kDefaultWhite.withOpacity(0.7),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pushNamed(context, "/cart"),
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
                      ),
                    ),
                  ),
                ),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: kDefaultWhite.withOpacity(0.7),
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    CarbonIcons.arrow_left,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: product.name,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      height: 100.0,
                      width: 150.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade600,
                        child: const Icon(CarbonIcons.image),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: SizedBox(
                      height: 100.0,
                      width: 150.0,
                      child: Icon(
                        CarbonIcons.image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$currency ${formatter.format(product.price)}",
                          style: const TextStyle(
                            color: kDarkGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: CartItemManager(
                          // spanned: true,
                          iconSize: 45.0,
                          product: product,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.description ?? "",
                    style: TextStyle(
                      fontSize: 14.0,
                      letterSpacing: 1.0,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
