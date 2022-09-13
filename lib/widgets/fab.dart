import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';

class BuildFAB extends StatefulWidget {
  const BuildFAB({Key? key}) : super(key: key);

  @override
  State<BuildFAB> createState() => _BuildFABState();
}

class _BuildFABState extends State<BuildFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (context) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Shop by",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.deepOrange,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Constants.kpadding,
                      ),
                      _buildCategory(
                          Category: "Clothes",
                          icondata: Icons.book,
                          color: Colors.blue),
                      _buildCategory(
                          Category: "Vides Games",
                          icondata: Icons.sports_esports,
                          color: Colors.deepOrange),
                      _buildCategory(
                          Category: "Music and Movies",
                          icondata: Icons.movie,
                          color: Colors.blue),
                      _buildCategory(
                          Category: "Grocery",
                          icondata: Icons.local_grocery_store_outlined,
                          color: Colors.cyan),
                      _buildCategory(
                          Category: "Health & Beauty",
                           icondata: Icons.home,
                          color: Colors.yellow.shade700),
                      _buildCategory(
                          Category: "Sports",
                          icondata: Icons.sports_basketball_rounded,
                          color: Colors.red),
                      _buildCategory(
                          Category: "Clothes",
                          icondata: Icons.book,
                          color: Colors.blue),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )),
                ));
      },
      backgroundColor: Colors.white,
      child: Icon(
        Icons.list_alt_rounded,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildCategory(
      {required String Category,
      required IconData icondata,
      required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Constants.kpadding),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 2 * Constants.kpadding,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(
                  icondata,
                  color: Colors.white,
                ),
              ),
              Text(
                Category,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
