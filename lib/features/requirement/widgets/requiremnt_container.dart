import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/features/requirement/controller/requirement_controller.dart';

class RequirementContainer extends StatelessWidget {
  final int index;
  const RequirementContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RequirementController>(builder: (context, provider, _) {
      var data = provider.requirements?.data?[index];
      return Container(
        margin: EdgeInsets.only(top: 25, left: 25, right: 25),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${data?.brand?.name} ${data?.vehicleModel?.name}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fuel",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  Text(
                    "${data?.fuelType?.name}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  Text(
                    "${data?.vehicleColor?.name}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Active",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.9,
                    child: CupertinoSwitch(
                      activeColor: AppColors.primary,
                      value: data?.status == "active",
                      onChanged: (bool value) {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
