import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/leading_button.dart';
import 'package:vehup/features/requirement/view/select_preference.dart';

class RequirementView extends StatelessWidget {
  const RequirementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingButton(),
        centerTitle: true,
        title: Text(
          "Requirement  List",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25, left: 25, right: 25),
            // height: 150,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Rolls Roys Ghost Standard (2020)",
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
                        "Transmission",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      Text(
                        "Transmission",
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
                        "Transmission",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      Text(
                        "Transmission",
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
                          value: true,
                          onChanged: (bool value) {
                            // Handle the value change here
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SelectPreference()));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                Text(
                  "Create A Requirement",
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
