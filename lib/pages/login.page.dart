import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/components/custom_TextField.dart';
import 'package:pas/components/custom_button.dart';
import 'package:pas/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
        
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/image/login.png',
                  height: 100,
                ),
                const SizedBox(height: 30),
                const Text(
                  'LOGIN SEKARANG',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'APLIKASI MAKANAN DAN LIST CLUB.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  myHint: 'Username',
                  textController: controller.txtUsername,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  myHint: 'Password',
                  textController: controller.txtPassword,
                ),
                const SizedBox(height: 24),
                Obx(() => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        backgroundColor: const Color.fromARGB(255, 244, 243, 243),
                        foregroundColor: const Color.fromARGB(255, 1, 1, 1),
                        onPressed: () {
                          controller.login();
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20, 
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
    );
  }
}