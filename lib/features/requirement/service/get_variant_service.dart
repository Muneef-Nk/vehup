import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehup/core/api/api.dart';
import 'package:vehup/core/utils/helper_function.dart';
import 'package:vehup/features/requirement/model/get_variant_model.dart';

class GetVariantService {
  static Future<GetVariantModel> getVariantData(
      int vehicleType, int brandId, int modelId) async {
    final url = Uri.parse(
        '${ApiConfig.BASE_URL}${ApiConfig.GET_VARIANT_DATA}/$vehicleType/$brandId/$modelId');

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
      return GetVariantModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
