import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vehup/core/color/color_contansts.dart';

class VehicleDetailsView extends StatefulWidget {
  const VehicleDetailsView({super.key});

  @override
  State<VehicleDetailsView> createState() => _VehicleDetailsViewState();
}

class _VehicleDetailsViewState extends State<VehicleDetailsView> {
  int selectedIndex = -1;
  int selectSection = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildHeaderSection(context),
            _buildActionButtons(),
            _buildDetailsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/Rectangle 30.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Positioned(
      top: 20,
      right: 10,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/share.svg",
              width: 25,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/more.svg",
              width: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildTitleRow(),
            const SizedBox(height: 8),
            Text("23242",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 20),
            _buildSpecificationsSection(),
            SizedBox(height: 8),
            Text(
              "Listed 2 days ago",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primaryLight,
              ),
            ),
            SizedBox(height: 15),
            Divider(
              thickness: 0.5,
              color: AppColors.gray,
            ),
            SizedBox(height: 15),
            Text(
              "Vehicle Information",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
                childAspectRatio: 1.4,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SvgPicture.asset(
                      _getSvgAsset(index),
                      width: 30,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getMainText(index),
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            _getSubText(index),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(child: Divider()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffC5C5C5),
                  ),
                  child: Text(
                    "View More",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab(
                  title: "Overview",
                  index: 0,
                  isSelected: selectSection == 0,
                ),
                _buildTab(
                  title: "Specification",
                  index: 1,
                  isSelected: selectSection == 1,
                ),
                _buildTab(
                  title: "Feature",
                  index: 2,
                  isSelected: selectSection == 2,
                ),
              ],
            ),
            SizedBox(height: 18),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transmission",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Automatic",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 10)
              ],
            ),
          ]),
        ),
      ),
    );
  }

  // Helper function to build each tab
  Widget _buildTab({
    required String title,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectSection = index; // Update selected index on tap
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.white, // Change color based on selection
          border: Border.all(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? AppColors.white
                : AppColors.primary, // Change text color based on selection
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "Rolls Roys Cullinan Series II (2020)",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SvgPicture.asset('assets/Heart.svg'),
      ],
    );
  }

  Widget _buildSpecificationsSection() {
    return Container(
      height: 72,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.background,
      ),
      child: Column(
        children: [
          _buildSpecificationsRow([
            _SpecificationItem(
              icon: "assets/Frame1.svg",
              label: "AUTOMATIC",
            ),
            _SpecificationItem(
              icon: "assets/colorfilter.svg",
              label: "BLACK",
            ),
            _SpecificationItem(
              icon: "assets/Fuel_black.svg",
              label: "PETROL",
            ),
            _SpecificationItem(
              icon: "assets/sadan.svg",
              label: "SEDAN",
            ),
          ]),
          const SizedBox(height: 15),
          _buildSpecificationsRow([
            _SpecificationItem(
              icon: "assets/Speed Meter.svg",
              label: "10,000",
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSpecificationsRow(List<_SpecificationItem> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((item) => item.build(context)).toList(),
    );
  }
}

class _SpecificationItem {
  final String icon;
  final String label;

  _SpecificationItem({required this.icon, required this.label});

  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 16),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// Method to return the appropriate asset for each index
String _getSvgAsset(int index) {
  switch (index) {
    case 0:
      return 'assets/Calendar.svg';
    case 1:
      return 'assets/Speed Meter.svg';
    case 2:
      return 'assets/Fuel.svg';
    case 3:
      return 'assets/User.svg';
    case 4:
      return 'assets/User.svg';
    case 5:
      return 'assets/User.svg';
    case 6:
      return 'assets/colorfilterprimary.svg';
    case 7:
      return 'assets/Shield.svg';
    case 8:
      return '';
    default:
      return '';
  }
}

// Method to return the main text for each index
String _getMainText(int index) {
  switch (index) {
    case 0:
      return '2020';
    case 1:
      return '10,0000';
    case 2:
      return 'Petrol';
    case 3:
      return '1';
    case 4:
      return 'Black';
    case 5:
      return '--';
    case 6:
      return '4999';
    case 7:
      return '31-12-2024';
    case 8:
      return '';
    default:
      return '';
  }
}

// Method to return the sub text for each index
String _getSubText(int index) {
  switch (index) {
    case 0:
      return 'Year';
    case 1:
      return 'KMS';
    case 2:
      return 'Fuel';
    case 3:
      return 'Owner';
    case 4:
      return 'Color';
    case 5:
      return 'Mileage';
    case 6:
      return 'Engine CC';
    case 7:
      return 'Insurance Valid';
    case 8:
      return '';
    default:
      return '';
  }
}
