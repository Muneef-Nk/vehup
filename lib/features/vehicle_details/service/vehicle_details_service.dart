import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehup/core/api/api.dart';
import 'package:vehup/core/utils/helper_function.dart';
import 'package:vehup/features/vehicle_details/model/vehicle_details_model.dart';

class GetTotalVehicleDetailsService {
  static Future<TotalVehicleDetailsModel> getVehicleDetails(int id) async {
    final url = Uri.parse(
        '${ApiConfig.BASE_URL}${ApiConfig.GET_TOTAL_VEHICLE_DETAILS}/$id');

    final token = await getAccessToken();

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      return TotalVehicleDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
