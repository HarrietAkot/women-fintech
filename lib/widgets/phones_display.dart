import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/models/phones_model.dart';

List<Widget> buildPhoneDisplay({required PhonesModel phones}) => [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            phones.secondImage,
            height: 350,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.all(Constants.kpadding),
        child: Text(
          phones.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      )
    ];