import 'package:flutter/material.dart';
import 'package:vehup/core/color/color_contansts.dart';

class DashboardController with ChangeNotifier {
  final List<Map<String, dynamic>> data = [
    {
      "color": AppColors.lightBlue,
      "icon": "assets/car1.svg",
      "count": "100",
      "name": "Total Vehicle"
    },
    {
      "color": AppColors.brightGreen,
      "icon": "assets/Group.svg",
      "count": "50",
      "name": "Total Bookings"
    },
    {
      "color": AppColors.brightRed,
      "icon": "assets/fi_493808.svg",
      "count": "25",
      "name": "C2B Concept"
    },
    {
      "color": AppColors.deepBlue,
      "icon": "assets/fi_2155941.svg",
      "count": "35",
      "name": "Vehicle for Sale"
    },
  ];
}
