import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehup/core/api/api.dart';
import 'package:vehup/core/utils/helper_function.dart';
import 'package:vehup/features/requirement/model/model_data_model.dart';

class GetModelService {
  static Future<ModelDataModel> getModelData(
      int vehicleType, int brandId) async {
    final url = Uri.parse(
        '${ApiConfig.BASE_URL}${ApiConfig.GET_MODEL_DATA}/$vehicleType/$brandId');

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
      return ModelDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
