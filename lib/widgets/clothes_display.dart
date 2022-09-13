import 'package:flutter/material.dart';
import 'package:jebajeba_beta/models/clothes_model.dart';

import '../constants.dart';

List<Widget> buildClothesDisplay({required ClothesModel clothes}) => [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            clothes.secondImage,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.all(Constants.kpadding),
        child: Text(
          clothes.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      )
    ];
