import 'package:flutter/material.dart';
import 'package:vehup/features/vehicle_details/model/vehicle_details_model.dart';
import 'package:vehup/features/vehicle_details/service/vehicle_details_service.dart';

class VehicleDetailsController with ChangeNotifier {
  int selectedIndex = 0;

  int _selectedSection = 0;

  int get selectedSection => _selectedSection;

  void setSelectedSection(int index) {
    _selectedSection = index;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  TotalVehicleDetailsModel? vehicleDetails;

  Future<void> getVehicleDetails({
    required BuildContext ctx,
    required int id,
  }) async {
    _setLoading(true);

    vehicleDetails = await GetTotalVehicleDetailsService.getVehicleDetails(id);

    print(vehicleDetails);

    print(vehicleDetails?.data?.images?[0].imageUrl);

    _errorMessage = 'Failed to load vehicles. Please try again later.';

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  int getItemCount() {
    switch (selectedSection) {
      case 0:
        return vehicleDetails?.data?.overviewDetails?.length ?? 0;
      case 1:
        return vehicleDetails?.data?.specificationDetails?.length ?? 0;
      case 2:
        return vehicleDetails?.data?.vehicleDetailFeatureVehicles?.length ?? 0;
      default:
        return 0;
    }
  }
}
