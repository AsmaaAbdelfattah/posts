import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/controllers/login_model.dart';
import 'package:posts/helpers/app_color.dart';
import 'package:posts/helpers/app_state.dart';
import 'package:posts/views/home_page.dart';
import 'package:posts/views/widgets/password_widget.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginModel>(
        init: LoginModel(),
        builder: (loginModel) => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.backgroundTop,
                AppColors.backgroundMiddle,
                AppColors.backgroundBottom,
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 32,
                  mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.stretch, 
                  children: [
                    SizedBox(height: 50),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to Posts App',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Please log in to continue',
                          style: TextStyle(fontSize: 16, color: AppColors.gray),
                        ),
                      ],
                    ),
                        
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        const Text(
                          "Username",
                          style: TextStyle(fontSize: 16, color: AppColors.gray),
                          textAlign: TextAlign.start,
                        ),
                        
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your username",
                            filled: true,
                            fillColor: AppColors.inputBackground,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            loginModel.email = value;
                          },
                        ),
                      ],
                    ),
                        
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(fontSize: 16, color: AppColors.gray),
                          textAlign: TextAlign.start,
                        ),

                        PasswordWidget(
                          onChanged: (value) {
                            loginModel.password = value;
                          },
                        ),
                      ],
                    ),
                        
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          //MARK: - Validate username and password before calling login
                          if (formKey.currentState!.validate()){
                          if (loginModel.validateUsername() && loginModel.validatePassword()){
                            loginModel.login().then((success) {
                              if (success) {
                                // Handle successful login, e.g., navigate to another page
                                getxStorage.write('isLoggedIn', true);
                                Get.to(const HomePage()); // Navigate to HomePage on successful login
                              } else {
                                // Handle login failure, e.g., show error message
                              Get.snackbar(
                                  'Login Failed',
                                  'Invalid email or password. Please try again.',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white,
                                );
                              }
                            });
                          }} 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
