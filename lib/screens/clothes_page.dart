import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/models/clothes_model.dart';
import 'package:jebajeba_beta/widgets/description.dart';

import '../widgets/clothes_display.dart';

class ClothesPage extends StatefulWidget {
  ClothesPage({required this.clothes});
  final ClothesModel clothes;

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(Constants.kpadding),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.clothes.favorite = !widget.clothes.favorite;
                  });
                },
                icon: Icon(
                  widget.clothes.favorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.deepOrange,
                )),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.kpadding * 4),
          child: Column(
            children: [
              ...buildClothesDisplay(clothes: widget.clothes),
              ...buildDescription()
            ],
          ),
        ),
      )),
    );
  }
}
