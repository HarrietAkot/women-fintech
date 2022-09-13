import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/models/phones_model.dart';
import 'package:jebajeba_beta/widgets/description.dart';
import 'package:jebajeba_beta/widgets/phones_display.dart';

class PhonesPage extends StatefulWidget {
  PhonesPage({required this.phones});
  final PhonesModel phones;

  @override
  State<PhonesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<PhonesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_double_arrow_left_outlined,
              color: Colors.black87,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.all(Constants.kpadding),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.phones.favorite = !widget.phones.favorite;
                  });
                },
                icon: Icon(
                  widget.phones.favorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
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
              ...buildPhoneDisplay(phones: widget.phones),
              ...buildDescription()
            ],
          ),
        ),
      )),
    );
  }
}
