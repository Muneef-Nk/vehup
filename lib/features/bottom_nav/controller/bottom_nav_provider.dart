import 'package:flutter/material.dart';
import 'package:vehup/features/dashboard/view/dashboard_view.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final List<Widget> screens = [
    DashboardView(),
  ];
}
