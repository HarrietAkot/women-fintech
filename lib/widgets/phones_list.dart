import 'package:flutter/material.dart';
import 'package:jebajeba_beta/constants.dart';
import 'package:jebajeba_beta/models/phones_model.dart';
import 'package:jebajeba_beta/screens/phones_page.dart';
import 'package:jebajeba_beta/services/toast_service.dart';
import 'package:jebajeba_beta/theme/colors.dart';
import 'package:jebajeba_beta/widgets/see_all.dart';

final List<PhonesModel> phones = PhonesModel.phones;

class BuildPhonesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity(0.1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Constants.kpadding,
                horizontal: Constants.kpadding * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phones",
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // TODO: see all phones
                SeeAllWidget(
                  action: () {},
                  title: "See All",
                  category: "Phones",
                ),
                // TextButton(
                //   onPressed: () {
                //     ToastNotificationService.showNotification(
                //         "See all phones...");
                //   },
                //   child: Text(
                //     "See All",
                //     style: TextStyle(
                //       color: kDefaultWhite,
                //     ),
                //   ),
                //   style: TextButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 2.0, horizontal: Constants.kpadding),
                //     backgroundColor: Colors.deepOrange,
                //     primary: Colors.white,
                //     minimumSize: Size(5, 5),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                phones.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          // color: kBrandLight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  phones[index].image,
                                  width: 200,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                phones[index].title,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                phones[index].subtitle,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextButton(
                                  onPressed: () {
                                    ToastNotificationService
                                        .showSuccessNotification(
                                            "Added to cart");
                                  },
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      color: kDefaultWhite,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: Constants.kpadding,
                                    ),
                                    backgroundColor: kBrandAccent,
                                    // primary: kDefaultWhite,
                                    minimumSize: Size(5, 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhonesPage(
                              phones: phones[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
