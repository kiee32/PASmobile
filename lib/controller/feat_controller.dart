import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/team_model.dart';

class FeatController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<Team> teamList = <Team>[].obs;
  final RxString errorMessage = ''.obs;

  final String apiUrl =
      'https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League';

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final PremierLeagueModel model = premierLeagueModelFromJson(response.body);
        teamList.assignAll(model.teams);
      } else {
        errorMessage.value = 'Gagal memuat tim (Status: ${response.statusCode})';
        Get.snackbar(
          'Error',
          errorMessage.value,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan koneksi: $e';
      Get.snackbar(
        'Koneksi Gagal',
        errorMessage.value,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
