import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehup/core/api/api.dart';
import 'package:vehup/core/utils/helper_function.dart';

class AddRequirementService {
  static addRequirement({
    required int typeId,
    required int brandId,
    required int modelId,
    required int variantId,
    required int transmissionId,
    required int fuelId,
    required int colorId, //bodyTpe
    required int year,
  }) async {
    final url = Uri.parse('${ApiConfig.BASE_URL}${ApiConfig.ADD_REQUIREMENT}');
    try {
      final token = await getAccessToken();

      final response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      }, body: {
        "vehicle_type_id": typeId.toString(),
        "brand_id": brandId.toString(),
        "vehicle_model_id": modelId.toString(),
        "vehicle_variant_id": variantId.toString(),
        "transmission_id": transmissionId.toString(),
        "fuel_type_id": fuelId.toString(),
        "vehicle_color_id": colorId.toString(),
        "year": year.toString(),
      });

      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
