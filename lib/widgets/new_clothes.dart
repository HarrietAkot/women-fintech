import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/models/clothes_model.dart';
import 'package:jebajeba_beta/screens/clothes_page.dart';

class BuildNewClothes extends StatelessWidget {
  final newClothes = ClothesModel.newclothes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.kpadding * 2,
            vertical: Constants.kpadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hot new Releases",
                style: TextStyle(
                    // color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
        InkWell(
          onTap: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClothesPage(
                          clothes: newClothes,
                        )));
          }),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Constants.kpadding),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      newClothes.image,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 2 * Constants.kpadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newClothes.title,
                          style: TextStyle(
                              // color: Colors.black, fontSize: 16
                              ),
                        ),
                        Text(newClothes.subtitle,
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 10),
                            textAlign: TextAlign.left),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("4.8"),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: Constants.kpadding,
                          ),
                          backgroundColor: Colors.deepOrange,
                          primary: Colors.white,
                          minimumSize: Size(5, 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }
}
