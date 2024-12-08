import 'package:flutter/material.dart';
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/utils/helper_function.dart';
import 'package:vehup/features/bottom_nav/view/mainscreen.dart';
import 'package:vehup/features/login/service/login_service.dart';

class LoginController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login({
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    _setLoading(true);

    try {
      final response = await LoginService.signin(
        email: email,
        password: password,
      );

      print(response);

      if (response['status'] == true) {
        showSnackBar(context, response['message'] ?? 'Logged In',
            backgroundColor: AppColors.primary);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
        saveAccessToken(response['token']);
      } else {
        if (response['message'] is List) {
          String combinedMessages = response['message'].join('\n');
          showSnackBar(context, combinedMessages);
        } else {
          showSnackBar(context, response['message'] ?? 'Something went wrong!');
        }
      }
    } catch (e) {
      showSnackBar(context, 'An error occurred. Please try again.');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
