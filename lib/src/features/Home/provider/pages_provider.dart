import 'package:flutter/material.dart';

class PagesProvider extends ChangeNotifier {
  int currentPage = 0;
  changePage(int x) {
    currentPage = x;
    notifyListeners();
  }
}
