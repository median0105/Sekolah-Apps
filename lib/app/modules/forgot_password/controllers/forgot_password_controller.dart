import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final isLoading = false.obs;

  Future<void> resetPassword() async {
    if (emailController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Email tidak boleh kosong');
      return;
    }

    try {
      isLoading.value = true;
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      
      await _auth.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      
      Get.back();
      Get.snackbar(
        'Success', 
        'Link reset password dikirim ke ${emailController.text.trim()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.back(); // Kembali ke login
      
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar(
        'Error', 
        e.message ?? 'Gagal kirim email reset',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}