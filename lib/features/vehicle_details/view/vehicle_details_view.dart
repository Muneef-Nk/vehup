import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/loading.dart';
import 'package:vehup/features/vehicle_details/controller/vehicle_details_controller.dart';

class VehicleDetailsView extends StatefulWidget {
  final int id;
  const VehicleDetailsView({super.key, required this.id});

  @override
  State<VehicleDetailsView> createState() => _VehicleDetailsViewState();
}

class _VehicleDetailsViewState extends State<VehicleDetailsView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VehicleDetailsController>(context, listen: false)
          .getVehicleDetails(ctx: context, id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Consumer<VehicleDetailsController>(builder: (context, provider, _) {
          return provider.isLoading
              ? Center(
                  child: Loading(),
                )
              : Stack(
                  children: [
                    _buildHeaderSection(context, provider),
                    _buildActionButtons(provider),
                    _buildLeadingButtons(),
                    _buildDetailsSection(context, provider),
                  ],
                );
        }),
      ),
    );
  }

  Widget _buildHeaderSection(
    BuildContext context,
    VehicleDetailsController provider,
  ) {
    return Positioned(
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              '${provider.vehicleDetails?.data?.images?[provider.selectedIndex].imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.vehicleDetails?.data?.images?.length,
                itemBuilder: (context, index) {
                  final isSelected = provider.selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        provider.selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Image.network(
                        provider.vehicleDetails?.data?.images?[index]
                                .imageUrl ??
                            '',
                        fit: BoxFit.cover,
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

  Widget _buildActionButtons(
    VehicleDetailsController provider,
  ) {
    return Positioned(
      top: 20,
      right: 10,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              //
            },
            icon: SvgPicture.asset(
              "assets/share.svg",
              width: 25,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              //
            },
            icon: SvgPicture.asset(
              "assets/more.svg",
              width: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingButtons() {
    return Positioned(
      top: 20,
      left: 10,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(
              "assets/arrow-left.svg",
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              width: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(
    BuildContext context,
    VehicleDetailsController provider,
  ) {
    final data = provider.vehicleDetails?.data;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${data?.brand?.name} ${data?.bodyType?.name}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SvgPicture.asset('assets/Heart.svg'),
                ],
              ),
              SizedBox(height: 8),
              Text("₹${data?.price}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              _buildSpecificationsSection(provider),
              SizedBox(height: 8),
              Text(
                "Listed ${data?.listedDays} days ago",
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
              VehicleInformations(provider: provider),
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
                    isSelected: provider.selectedSection == 0,
                    provider: provider,
                  ),
                  _buildTab(
                    title: "Specification",
                    index: 1,
                    isSelected: provider.selectedSection == 1,
                    provider: provider,
                  ),
                  _buildTab(
                    title: "Feature",
                    index: 2,
                    isSelected: provider.selectedSection == 2,
                    provider: provider,
                  ),
                ],
              ),
              SizedBox(height: 18),
              ListView.builder(
                itemCount: provider.getItemCount(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (provider.selectedSection == 0) {
                    return _buildOverviewItem(index, provider);
                  } else if (provider.selectedSection == 1) {
                    return _buildSpecificationItem(index, provider);
                  } else {
                    return _buildFeatureItem(index, provider);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewItem(
    int index,
    VehicleDetailsController provider,
  ) {
    var item = provider.vehicleDetails?.data
        ?.overviewDetails?[index]; // Replace with actual data list
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item?.overview?.name ?? '-',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              item?.overviewDetails ?? '-',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 10)
      ],
    );
  }

  Widget _buildSpecificationItem(
    int index,
    VehicleDetailsController provider,
  ) {
    var item = provider.vehicleDetails?.data
        ?.specificationDetails?[index]; // Replace with actual data list
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item?.specification?.name ?? '-',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              item?.specificationDetails ?? '-',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 10)
      ],
    );
  }

  Widget _buildFeatureItem(
    int index,
    VehicleDetailsController provider,
  ) {
    var item = provider.vehicleDetails?.data
        ?.vehicleDetailFeatureVehicles?[index]; // Replace with actual data list
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item?.vehicleFeature?.name ?? '-',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 10)
      ],
    );
  }

  Widget _buildTab({
    required String title,
    required int index,
    required bool isSelected,
    required VehicleDetailsController provider,
  }) {
    return GestureDetector(
      onTap: () {
        provider.setSelectedSection(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: AppColors.gray,
                  spreadRadius: 1,
                  blurRadius: 10,
                )
            ],
            border: Border.all(color: AppColors.primaryLight)),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSpecificationsSection(
    VehicleDetailsController provider,
  ) {
    final data = provider.vehicleDetails?.data;

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
              label: "${data?.transmission?.name}",
            ),
            _SpecificationItem(
              icon: "assets/colorfilter.svg",
              label: "${data?.vehicleColor?.name}",
            ),
            _SpecificationItem(
              icon: "assets/Fuel_black.svg",
              label: "${data?.fuelType?.name}",
            ),
            _SpecificationItem(
              icon: "assets/sadan.svg",
              label: "${data?.bodyType?.name}",
            ),
          ]),
          const SizedBox(height: 15),
          _buildSpecificationsRow([
            _SpecificationItem(
              icon: "assets/Speed Meter.svg",
              label: "${data?.kmDriven}",
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

class VehicleInformations extends StatelessWidget {
  const VehicleInformations({
    super.key,
    required this.provider,
  });

  final VehicleDetailsController provider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4,
      ),
      itemCount: provider.vehicleDetails?.data?.vehicleInfoDetails?.length,
      itemBuilder: (context, index) {
        var info = provider.vehicleDetails?.data?.vehicleInfoDetails?[index];
        return Row(
          children: [
            Image.network(
              info?.vehicleInfo?.icon ?? '',
              width: 30,
            ),
            SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    info?.infoDetails ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    info?.vehicleInfo?.name ?? '',
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
