import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/features/bottom_nav/controller/bottom_nav_provider.dart';
import 'package:vehup/features/requirement/view/requirement_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        children: [
          _buildNavItem(
            context: context,
            icon: "assets/home.svg",
            label: 'Home',
            index: 0,
          ),
          _buildNavItem(
            context: context,
            icon: "assets/Message.svg",
            label: 'Message',
            index: 1,
          ),
          _buildNavItem(
            context: context,
            label: 'Sell',
            index: 2,
          ),
          _buildNavItem(
            context: context,
            icon: "assets/task-square.svg",
            label: 'Requirement',
            index: 3,
          ),
          _buildNavItem(
            context: context,
            icon: "assets/User.svg",
            label: 'Profile',
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    String? icon,
    required String label,
    required int index,
  }) {
    final currentIndex = context.watch<BottomNavProvider>().currentIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          print(index);
          if (index == 3) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RequirementView()));
          } else {
            context.read<BottomNavProvider>().setIndex(index);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? SvgPicture.asset(
                    icon,
                    height: 25,
                    colorFilter: ColorFilter.mode(
                      currentIndex == index
                          ? AppColors.primary
                          : AppColors.gray,
                      BlendMode.srcIn,
                    ),
                  )
                : SizedBox(height: 25),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
