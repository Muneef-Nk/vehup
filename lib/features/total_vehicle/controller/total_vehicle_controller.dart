import 'package:flutter/material.dart';
import 'package:vehup/features/total_vehicle/service/get_vehicles_service.dart';
import 'package:vehup/features/total_vehicle/model/total_vehicles_model.dart';

class TotalVehicleController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  TotalVehicleModel? vehicles;

  Future<void> getTotalVehicles() async {
    _setLoading(true);

    try {
      vehicles = await GetTotalVehiclesService.getVehicles();
    } catch (e) {
      _errorMessage = 'Failed to load vehicles. Please try again later.';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
