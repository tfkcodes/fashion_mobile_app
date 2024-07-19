import 'package:flutter/material.dart';

class MainNavigationProvider extends ChangeNotifier{
  int _visit = 0;

    int get visit => _visit;

      setVisit(int visit) {
    _visit = visit;
    notifyListeners();
  }

}