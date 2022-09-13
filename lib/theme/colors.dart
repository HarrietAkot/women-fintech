import 'package:flutter/material.dart';

// convert custom color to material color
Map<int, Color> color = {
  50: const Color.fromRGBO(3, 99, 209, .1),
  100: const Color.fromRGBO(3, 99, 209, .2),
  200: const Color.fromRGBO(3, 99, 209, .3),
  300: const Color.fromRGBO(3, 99, 209, .4),
  400: const Color.fromRGBO(3, 99, 209, .5),
  500: const Color.fromRGBO(3, 99, 209, .6),
  600: const Color.fromRGBO(3, 99, 209, .7),
  700: const Color.fromRGBO(3, 99, 209, .8),
  800: const Color.fromRGBO(3, 99, 209, .9),
  900: const Color.fromRGBO(3, 99, 209, 1),
};

MaterialColor customPrimarySwatch = MaterialColor(0xff0363d1, color);

const kBrandMain = Color(0xff0363d1);
const kBrandAccent = Color(0xff3d7bc4);
const kBrandLight = Color(0xff91beec);
const kDefaultBlack = Color(0xff000000);
const kDarkestGrey = Color(0xff2e2e2e);
const kDarkGrey = Color(0xff666565);
const kDefaultGrey = Color(0xffA8AAAB);
const kLightGrey = Color(0xffDFE0E2);
const kDefaultWhite = Color(0xffffffff);
const kDarkBlue = Color(0xff014361);
const kLinkBlue = Color(0xff048bc9);
const kSuccessGreen = Color(0xff029c1b);
const kWarningOrange = Color(0xfff29f05);
const kErrorRed = Color(0xffa80316);
