import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/features/bottom_nav/controller/bottom_nav_provider.dart';
import 'package:vehup/features/bottom_nav/widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<BottomNavProvider>().currentIndex;

    return Scaffold(
      body: Consumer<BottomNavProvider>(builder: (context, provider, _) {
        return IndexedStack(
          index: currentIndex,
          children: provider.screens,
        );
      }),
      floatingActionButton: GestureDetector(
        onTap: () {
          context.read<BottomNavProvider>().setIndex(2);
        },
        child: Container(
          padding: EdgeInsets.all(18),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/Dollar.svg',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
