import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/leading_button.dart';
import 'package:vehup/core/global/loading.dart';
import 'package:vehup/features/total_vehicle/controller/total_vehicle_controller.dart';
import 'package:vehup/features/vehicle_details/view/vehicle_details_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TotalVehicleView extends StatefulWidget {
  const TotalVehicleView({super.key});

  @override
  State<TotalVehicleView> createState() => _TotalVehicleViewState();
}

class _TotalVehicleViewState extends State<TotalVehicleView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TotalVehicleController>(context, listen: false)
          .getTotalVehicles(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Consumer<TotalVehicleController>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(child: Loading());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBar(),
                const SizedBox(height: 15),
                Expanded(child: _buildVehicleList(provider)),
              ],
            ),
          );
        },
      ),
    );
  }

  // Build the app bar
  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: AppColors.white,
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: LeadingButton(),
      title: Text(
        "Total Vehicles",
        style: TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Build the list of vehicles
  Widget _buildVehicleList(TotalVehicleController provider) {
    return ListView.builder(
      itemCount: provider.vehicles?.data?.length ?? 0,
      itemBuilder: (context, index) {
        var data = provider.vehicles?.data?[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: VehicleCard(data: data),
        );
      },
    );
  }
}

// Search Bar widget
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: AppColors.gray),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/Search.svg',
              width: 16,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

// Vehicle Card widget
class VehicleCard extends StatelessWidget {
  final dynamic data;
  const VehicleCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VehicleDetailsView(
              id: data?.id,
            ),
          ),
        );
      },
      child: Container(
        height: 334,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VehicleImageSlider(images: data?.images),
            Padding(
              padding: const EdgeInsets.all(16),
              child: VehicleInfo(data: data),
            ),
          ],
        ),
      ),
    );
  }
}

// Vehicle Image Slider widget
class VehicleImageSlider extends StatelessWidget {
  final List<dynamic>? images;
  const VehicleImageSlider({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CarouselSlider.builder(
        itemCount: images?.length ?? 0,
        itemBuilder: (context, index, _) {
          return images?[index]?.imageUrl != null
              ? Image.network(
                  images?[index]?.imageUrl,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}

// Vehicle Info widget
class VehicleInfo extends StatelessWidget {
  final dynamic data;
  const VehicleInfo({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${data?.brand?.name} ${data?.vehicleVariant?.name}",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data?.price?.toString() ?? '',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Listed ${data?.listedDays} days ago",
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 0.5),
        _buildVehicleDetails(data),
      ],
    );
  }

  Widget _buildVehicleDetails(dynamic data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDetailItem("assets/Calendar.svg", data?.year?.toString()),
        _buildDetailItem("assets/Speed Meter.svg", data?.kmDriven?.toString()),
        _buildDetailItem("assets/Fuel.svg", data?.fuelType?.name),
      ],
    );
  }

  Widget _buildDetailItem(String iconPath, String? label) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 8),
        Text(label ?? ''),
      ],
    );
  }
}
