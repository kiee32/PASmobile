import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/makanan_model.dart';
import '../routes.dart';

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<MakananModel> listMakanan = <MakananModel>[].obs;

  
  final String apiUrl = "https://www.themealdb.com/api/json/v1/1/categories.php";

  @override
  void onInit() {
    super.onInit();
    fetchMakanan();
  }

 
  Future<void> fetchMakanan() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List? categories = data['categories'];

        if (categories != null && categories.isNotEmpty) {
          listMakanan.value = categories
              .map((item) => MakananModel.fromJson(item))
              .toList();
        } else {
          listMakanan.assignAll(dummyMakananList);
        }

      }
    } catch (e) {
     
      listMakanan.assignAll(dummyMakananList);
    } finally {
      isLoading.value = false;
    }
  }

  void goToTransaksi(MakananModel Makanan) {
    Get.toNamed(
      Routes.transaksi,
      arguments: Makanan,
    );
  }
}
