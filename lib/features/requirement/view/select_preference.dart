import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/leading_button.dart';
import 'package:vehup/features/requirement/view/create_requirement.dart';

class SelectPreference extends StatelessWidget {
  const SelectPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const LeadingButton(),
        title: const Text(
          "What would you prefer to have?",
          style: TextStyle(fontSize: 16, color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                _buildSelectionCard(
                  context: context,
                  iconPath: 'assets/car.svg',
                  label: 'Car',
                  onTap: () => _navigateTo(context, CreateRequirement()),
                ),
                const SizedBox(width: 16),
                _buildSelectionCard(
                  context: context,
                  iconPath: 'assets/bike.svg',
                  label: 'Bike',
                  onTap: () => _navigateTo(context, CreateRequirement()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionCard({
    required BuildContext context,
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath, height: 40),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
