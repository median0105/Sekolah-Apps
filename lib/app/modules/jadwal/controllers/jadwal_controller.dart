import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalController extends GetxController {
  final matkulC = TextEditingController();
  final dosenC = TextEditingController();
  final hariC = TextEditingController();
  final ruangC = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  var isEdit = false.obs;
  String? docId;

  var selectedTime = ''.obs;

  void setData(Map<String, dynamic> data) {
    isEdit.value = true;
    docId = data['id'];

    matkulC.text = data['matkul'];
    dosenC.text = data['dosen'];
    hariC.text = data['hari'];
    ruangC.text = data['ruangan'];
    selectedTime.value = data['jam'];
  }

  void resetForm() {
    isEdit.value = false;
    docId = null;

    matkulC.clear();
    dosenC.clear();
    hariC.clear();
    ruangC.clear();
    selectedTime.value = '';
  }

  Future<void> pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (!context.mounted) return;

    if (picked != null) {
      selectedTime.value = picked.format(context);
    }
  }

  Future<void> saveJadwal() async {
    if (matkulC.text.isEmpty ||
        dosenC.text.isEmpty ||
        hariC.text.isEmpty ||
        ruangC.text.isEmpty ||
        selectedTime.value.isEmpty) {
      Get.snackbar("Error", "Semua field wajib diisi");
      return;
    }

    if (isEdit.value) {
      await firestore.collection('jadwal').doc(docId).update({
        "matkul": matkulC.text,
        "dosen": dosenC.text,
        "hari": hariC.text,
        "jam": selectedTime.value,
        "ruangan": ruangC.text,
      });

      Get.offAllNamed('/home');
      Get.snackbar("Sukses", "Jadwal berhasil diupdate");
    } else {
      await firestore.collection('jadwal').add({
        "matkul": matkulC.text,
        "dosen": dosenC.text,
        "hari": hariC.text,
        "jam": selectedTime.value,
        "ruangan": ruangC.text,
      });

      Get.back();
      Get.snackbar("Sukses", "Jadwal berhasil ditambahkan");
    }
    Get.back();
  }

  Future<void> deleteJadwal(String id) async {
    await firestore.collection('jadwal').doc(id).delete();

    Get.offAllNamed('/home');
    Get.snackbar("Sukses", "Jadwal berhasil dihapus");
  }

  @override
  void onClose() {
    matkulC.dispose();
    dosenC.dispose();
    hariC.dispose();
    ruangC.dispose();
    super.onClose();
  }
}