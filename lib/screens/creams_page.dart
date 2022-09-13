import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/models/creams_model.dart';
import 'package:jebajeba_beta/widgets/description.dart';

import '../widgets/creams_display.dart';

class CreamsPage extends StatefulWidget {
  CreamsPage({required this.creams});
  final CreamsModel creams;

  @override
  State<CreamsPage> createState() => _CreamsPageState();
}

class _CreamsPageState extends State<CreamsPage> {
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
                    widget.creams.favorite = !widget.creams.favorite;
                  });
                },
                icon: Icon(
                  widget.creams.favorite
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
              ...buildCreamDisplay(creams: widget.creams),
              ...buildDescription()
            ],
          ),
        ),
      )),
    );
  }
}
