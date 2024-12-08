import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/features/total_vehicle/view/total_vehicle_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final List<Color> colors = [
    AppColors.lightBlue,
    AppColors.brightGreen,
    AppColors.brightRed,
    AppColors.deepBlue,
  ];
  final List icons = [
    "assets/car1.svg",
    "assets/Group.svg",
    "assets/fi_493808.svg",
    "assets/fi_2155941.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.0,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return _buildGridItem(
              iconBackground: colors[index],
              count: "35",
              text: "Item fsdfjsdf",
              icon: icons[index],
              onPressed: () {
                print('clicked');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TotalVehicleView()));
              },
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          "assets/menu.svg",
          width: 24,
          height: 24,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/Notification.svg',
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem({
    required Color iconBackground,
    required Function() onPressed,
    required String count,
    required String text,
    required String icon,
  }) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8.0,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: iconBackground,
                child: SvgPicture.asset(icon),
              ),
              const SizedBox(height: 16.0),
              Text(
                count,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
