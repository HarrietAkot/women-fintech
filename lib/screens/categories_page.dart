import 'package:badges/badges.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/models/product.dart';
import 'package:jebajeba_beta/theme/colors.dart';

import '../custom/product_tile.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key, required this.products, required this.title})
      : super(key: key);

  final List<Product> products;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
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
        ],
      ),
      body: products.isEmpty
          ? Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/sad.png",
                      height: 40.0,
                      width: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "There are no products available.",
                      style: TextStyle(
                        color: kBrandAccent,
                        fontStyle: FontStyle.italic,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
          )
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(
                products.length,
                (index) {
                  return Center(
                    child: ProductTile(product: products[index]),
                  );
                },
              ),
            ),
    );
  }
}
