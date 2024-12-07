import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        "assets/arrow-left.svg",
        width: 25,
      ),
      onPressed: () {
        Navigator.pop(context); // Navigation back
      },
    );
  }
}
