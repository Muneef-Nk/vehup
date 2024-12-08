import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vehup/core/color/color_contansts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final String prefixImage;
  final TextEditingController? controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    required this.label,
    required this.prefixImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(prefixImage),
            ),
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'assets/eye-slash.svg',
                      ),
                    ))
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
          ),
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
