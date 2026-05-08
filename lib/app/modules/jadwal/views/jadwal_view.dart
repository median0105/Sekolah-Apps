import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  const JadwalView({super.key});

  static const Color _primary = Color(0xFF1E5DB6);
  static const Color _soft = Color(0xFFEAF2FF);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JadwalController>();
    final data = Get.arguments;

    if (data != null) {
      controller.setData(data);
    }

    return Scaffold(
      backgroundColor: _soft,
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.isEdit.value ? "Edit Jadwal" : "Tambah Jadwal",
          ),
        ),
        centerTitle: true,
        backgroundColor: _primary,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x141E5DB6),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              TextField(
                controller: controller.matkulC,
                decoration: _input("Mata Kuliah"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: controller.dosenC,
                decoration: _input("Nama Dosen"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: controller.hariC,
                decoration: _input("Hari"),
              ),
              const SizedBox(height: 12),

              Obx(
                () => InkWell(
                  onTap: () => controller.pickTime(context),
                  child: InputDecorator(
                    decoration: _input("Jam"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.selectedTime.value.isEmpty
                              ? "Pilih Jam"
                              : controller.selectedTime.value,
                        ),
                        const Icon(Icons.access_time),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: controller.ruangC,
                decoration: _input("Ruangan"),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: controller.saveJadwal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _input(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: _soft,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }
}