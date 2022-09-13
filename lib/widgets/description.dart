import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';

List<Widget> buildDescription() => [
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(Constants.kpadding),
        child: SingleChildScrollView(
            child: Text(
          "data",
          textAlign: TextAlign.justify,
        )),
      )),
      Padding(
        padding: EdgeInsets.all(Constants.kpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("share"),
            TextButton(
              onPressed: () {},
              child: Text("One click away"),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 3, horizontal: Constants.kpadding),
                  minimumSize: Size(5, 5),
                  backgroundColor: Colors.deepOrange,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            )
          ],
        ),
      )
    ];
