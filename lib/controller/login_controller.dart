
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas/model/login_model.dart';
import 'package:pas/routes.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final String apiUrl =
      "https://mediadwi.com/api/latihan/login";

    var loginModel = Rxn<LoginModel>();

  Future<void> login() async {
    final username = txtUsername.text.trim(); 
    final password = txtPassword.text.trim();

    
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Peringatan", "Jangan kosong!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {

        loginModel.value = LoginModel.fromJson(
          jsonDecode(response.body),
        );

        if (loginModel.value?.status == true) {

          Get.snackbar(
            "Berhasil",
            loginModel.value!.message,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );

          Get.offAllNamed(Routes.mainmenu);
          

        } else {
          Get.snackbar(
            "Gagal",
            loginModel.value!.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }

      } else {
        Get.snackbar(
          "Gagal",
          "Cek internet connection",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } catch (e) {
      Get.snackbar(
        "Error",
        "Gagal konek ke server",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
