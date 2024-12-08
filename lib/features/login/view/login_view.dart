import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // Importing provider to use Consumer
import 'package:vehup/core/color/color_contansts.dart';
import 'package:vehup/core/global/loading.dart';
import 'package:vehup/features/login/controller/login_controller.dart'; // Assuming the controller is inside features/login/controller
import 'package:vehup/features/login/widgets/cusom_tex.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Consumer<LoginController>(
            builder: (context, loginController, child) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child: SvgPicture.asset('assets/logo.svg')),
                        Text(
                          "Login With Your Email & \nPassword",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Enter your email',
                          label: "Email",
                          prefixImage: 'assets/Email.svg',
                          controller: emailController,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Enter your password',
                          label: "Password",
                          prefixImage: 'assets/lock.svg',
                          controller: passwordController,
                          isPassword: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.deepBlue),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            loginController.login(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            );
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: loginController.isLoading
                                  ? Loading(
                                      color: AppColors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.white),
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.black),
                              ),
                              Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.deepBlue),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
