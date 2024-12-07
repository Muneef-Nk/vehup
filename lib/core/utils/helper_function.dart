import 'package:flutter/material.dart';
import 'package:vehup/core/color/color_contansts.dart';

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(
    color.value,
    <int, Color>{
      50: Color.alphaBlend(color.withOpacity(0.1), AppColors.white),
      100: Color.alphaBlend(color.withOpacity(0.2), AppColors.white),
      200: Color.alphaBlend(color.withOpacity(0.3), AppColors.white),
      300: Color.alphaBlend(color.withOpacity(0.4), AppColors.white),
      400: Color.alphaBlend(color.withOpacity(0.5), AppColors.white),
      500: color,
      600: Color.alphaBlend(color.withOpacity(0.6), AppColors.black),
      700: Color.alphaBlend(color.withOpacity(0.7), AppColors.black),
      800: Color.alphaBlend(color.withOpacity(0.8), AppColors.black),
      900: Color.alphaBlend(color.withOpacity(0.9), AppColors.black),
    },
  );
}
