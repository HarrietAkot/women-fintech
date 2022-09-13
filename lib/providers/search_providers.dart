import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String searchTerm = '';

  // update search term
  updateSearchTerm(String _searchTerm) {
    searchTerm = _searchTerm;
    notifyListeners();
  }

  // clear search term
  clear() {
    searchTerm = '';
    notifyListeners();
  }
}
