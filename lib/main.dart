import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/features/bottom_nav/controller/bottom_nav_provider.dart';
import 'package:vehup/features/bottom_nav/view/mainscreen.dart';
import 'package:vehup/features/total_vehicle/controller/total_vehicle_controller.dart';
import 'package:vehup/features/vehicle_details/controller/vehicle_details_controller.dart';

void main() {
  runApp(const Vehup());
}

class Vehup extends StatelessWidget {
  const Vehup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => TotalVehicleController()),
        ChangeNotifierProvider(create: (_) => VehicleDetailsController()),
      ],
      child: MaterialApp(
        title: 'Vehup',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.white,
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
