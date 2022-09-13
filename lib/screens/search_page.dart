import 'package:flutter/material.dart';
import 'package:jebajeba_beta/custom/drawer.dart';
import 'package:jebajeba_beta/providers/search_providers.dart';
import 'package:jebajeba_beta/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: buildSearchBar(context),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text("Search results for: ${searchProvider.searchTerm}"),
      ),
    );
  }
}
