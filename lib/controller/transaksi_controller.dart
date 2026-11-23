import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/model/makanan_model.dart';

class TransaksiController extends GetxController {
  late MakananModel makanan;


  var jumlah = 1.obs;
  var subtotal = 0.0.obs;
  var ppn = 0.0.obs;
  var totalBayar = 0.0.obs;
  var sudahDihitung = false.obs;

  @override
  void onInit() {
    super.onInit();
  
    if (Get.arguments is MakananModel) {
      makanan = Get.arguments as MakananModel;
      hitungOtomatis(); 
    } else {
     
      Get.snackbar("Error", "Data makanan tidak ditemukan!");
    }
  }

  
  void hitungOtomatis() {
    subtotal.value = (makanan.harga * jumlah.value).toDouble();
    ppn.value = subtotal.value * 0.05;
    totalBayar.value = subtotal.value + ppn.value;
  }

  void tambah() {
    jumlah.value++;
    hitungOtomatis();
  }

  void kurang() {
    if (jumlah.value > 1) {
      jumlah.value--;
      hitungOtomatis(); 
    }
  }

  void hitungPembayaran() {
    hitungOtomatis();
    sudahDihitung.value = true;
    tampilkanDialog();
  }

  void tampilkanDialog() {
    Get.defaultDialog(
      title: "Konfirmasi Pembayaran",
      middleText:
          "Makanan: ${makanan.namaMakanan}\n"
          "Jumlah: ${jumlah.value} porsi\n"
          "Subtotal: Rp ${subtotal.value.toInt()}\n"
          "PPN (5%): Rp ${ppn.value.toInt()}\n"
          "Total Bayar: Rp ${totalBayar.value.toInt()}",
      textConfirm: "Selesai",
      textCancel: "Tutup",
      confirmTextColor: Colors.white,
      buttonColor: Colors.indigo,
      onConfirm: () {
        Get.back();
        Get.snackbar("Sukses", "Pembayaran Berhasil!");
      },
    );
  }
}