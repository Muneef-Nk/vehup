import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehup/core/api/api.dart';

class LoginService {
  static signin({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse(ApiConfig.BASE_URL + ApiConfig.LOGIN);
      final response = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
