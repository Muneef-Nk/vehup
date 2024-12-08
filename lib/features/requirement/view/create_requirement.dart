import 'package:flutter/material.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/leading_button.dart';

class CreateRequirement extends StatefulWidget {
  CreateRequirement({super.key});

  @override
  State<CreateRequirement> createState() => _CreateRequirementState();
}

class _CreateRequirementState extends State<CreateRequirement> {
  String selectedOption = "Manual";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const LeadingButton(),
        surfaceTintColor: AppColors.white,
        title: const Text(
          "Vehicle Requirement",
          style: TextStyle(fontSize: 16, color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDropdown(
                hint: "Select Brand",
                label: 'Brand',
                items: [
                  "Brand A",
                  "Brand B",
                  "Brand C",
                ],
                onChanged: (value) {
                  //
                },
              ),
              _buildDropdown(
                hint: "Select Model",
                label: 'Model',
                items: [
                  "Brand A",
                  "Brand B",
                  "Brand C",
                ],
                onChanged: (value) {
                  //
                },
              ),
              _buildDropdown(
                hint: "Variant Model",
                label: 'Variant',
                items: [
                  "Brand A",
                  "Brand B",
                  "Brand C",
                ],
                onChanged: (value) {
                  //
                },
              ),
              _buildDropdown(
                hint: "Select Year",
                label: 'Year',
                items: [
                  "Brand A",
                  "Brand B",
                  "Brand C",
                ],
                onChanged: (value) {
                  //
                },
              ),
              // transition
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "Transmission",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      " *",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.brightRed,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    // selected
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = "Manual";
                          });
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selectedOption == "Manual"
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Manual',
                              style: TextStyle(
                                color: selectedOption == "Manual"
                                    ? AppColors.primary
                                    : Colors.black,
                                fontWeight: selectedOption == "Manual"
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),

                    // unseelcted
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = "Automatic";
                          });
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selectedOption == "Automatic"
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Automatic',
                              style: TextStyle(
                                color: selectedOption == "Automatic"
                                    ? AppColors.primary
                                    : Colors.black,
                                fontWeight: selectedOption == "Automatic"
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildDropdown(
                hint: "Select Fuel",
                label: 'Fuel',
                items: [
                  "Brand A",
                  "Brand B",
                  "Brand C",
                ],
                onChanged: (value) {
                  //
                },
              ),
              _buildDropdown(
                hint: "Select Color",
                label: 'Color',
                items: [
                  "Brand A",
                  "Brand B",
                  "Brand C",
                ],
                onChanged: (value) {
                  //
                },
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                margin: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                child: Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: AppColors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Text(
                  "$label",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  " *",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.brightRed,
                  ),
                ),
              ],
            ),
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 19, vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            hint: Text(
              hint,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.w400),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.black,
            ),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 14)),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
