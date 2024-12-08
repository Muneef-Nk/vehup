import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehup/core/api/api.dart';
import 'package:vehup/core/utils/helper_function.dart';
import 'package:vehup/features/total_vehicle/model/total_vehicles_model.dart';

class GetTotalVehiclesService {
  static Future<TotalVehicleModel> getVehicles() async {
    final url =
        Uri.parse('${ApiConfig.BASE_URL}${ApiConfig.GET_TOTAL_VEHICLE}');

    final token = await getAccessToken();

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return TotalVehicleModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
