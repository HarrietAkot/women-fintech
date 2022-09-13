import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/colors.dart';

// Widget buildHeader() => Container(
//       height: 200,
//       width: double.infinity,
//       child: Image.asset(
//         "assets/images/shipping.jpg",
//         fit: BoxFit.cover,
//       ),
//     );

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int current = 0;
  final CarouselController _controller = CarouselController();

  List<String> sliders = [
    "https://images.unsplash.com/photo-1612817288484-6f916006741a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
    "https://images.unsplash.com/photo-1580870069867-74c57ee1bb07?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2835&q=80",
    "https://images.unsplash.com/photo-1580618864180-f6d7d39b8ff6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80",
    "https://images.unsplash.com/photo-1598440947619-2c35fc9aa908?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 15),
            autoPlayAnimationDuration: const Duration(milliseconds: 2600),
            autoPlayCurve: Curves.fastOutSlowIn,
            // enlargeCenterPage: true,
            // aspectRatio: 2.0,
            height: 200,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
          items: sliders
              .map(
                (item) => Container(
                  margin: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: CachedNetworkImage(
                      imageUrl: item,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          height: 100.0,
                          width: 200.0,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade600,
                            child: const Icon(
                              CarbonIcons.image,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: SizedBox(
                          height: 100.0,
                          width: 200.0,
                          child: Icon(CarbonIcons.image_copy),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliders.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: current == entry.key ? 15 : 5.0,
                height: 5.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: current == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  borderRadius:
                      current == entry.key ? BorderRadius.circular(10) : null,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? kBrandAccent
                          : kBrandMain)
                      .withOpacity(
                    current == entry.key ? 0.9 : 0.4,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
