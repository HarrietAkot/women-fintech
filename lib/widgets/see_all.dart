import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/screens/categories_page.dart';
import 'package:jebajeba_beta/theme/colors.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget(
      {Key? key,
      required this.action,
      required this.title,
      required this.category})
      : super(key: key);

  final VoidCallback action;

  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesPage(
              title: category,
              products: allProducts
                  .where((product) => product.category
                      .toLowerCase()
                      .contains(category.toLowerCase()))
                  .toList(),
            ),
          ),
        );
      },
      child: Text(
        title,
        style: TextStyle(
          color: kDefaultWhite,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: Constants.kpadding,
        ),
        backgroundColor: Colors.deepOrange,
        // primary: kDefaultWhite,
        minimumSize: Size(5, 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
