import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehup/core/api/api.dart';
import 'package:vehup/core/utils/helper_function.dart';
import 'package:vehup/features/requirement/model/brand_model.dart';

class GetBrandService {
  static Future<BrandModel> getBrandData(int vehicleType) async {
    final url = Uri.parse(
        '${ApiConfig.BASE_URL}${ApiConfig.GET_BRAND_DATA}/$vehicleType');

    final token = await getAccessToken();

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return BrandModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
