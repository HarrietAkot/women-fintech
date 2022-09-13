import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:jebajeba_beta/providers/search_providers.dart';
import 'package:jebajeba_beta/theme/colors.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../services/toast_service.dart';

Widget buildSearchBar(BuildContext context) {
  final searchProvider = Provider.of<SearchProvider>(context, listen: true);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      keyboardType: TextInputType.text,
      onChanged: (_) {
        searchProvider.updateSearchTerm(_);
      },
      decoration: InputDecoration(
        hintText: "Search on Jeba",
        fillColor: kBrandLight.withOpacity(0.5),
        filled: true,
        prefixIcon: Icon(CarbonIcons.search),
        suffixIcon: IconButton(
          icon: Container(
            height: 40.0,
            width: 40.0,
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kDefaultWhite,
            ),
            child: Icon(
              CarbonIcons.microphone,
              color: Colors.red.shade800,
            ),
          ),
          onPressed: () {
            ToastNotificationService.showNotification("Speak now...");
          },
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: Constants.kpadding,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
