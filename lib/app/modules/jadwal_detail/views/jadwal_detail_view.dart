import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jadwal_detail_controller.dart';
import 'package:sekolah/app/modules/jadwal/controllers/jadwal_controller.dart';
class JadwalDetailView extends GetView<JadwalDetailController> {
  const JadwalDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Detail Jadwal"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // HEADER CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(Icons.menu_book, color: Colors.white, size: 40),
                  const SizedBox(height: 10),

                  Text(
                    data['matkul'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    data['dosen'],
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // DETAIL CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.grey.shade300,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  buildItem(Icons.calendar_today, "Hari", data['hari']),
                  const Divider(),

                  buildItem(Icons.access_time, "Jam", data['jam']),
                  const Divider(),

                  buildItem(Icons.meeting_room, "Ruangan", data['ruangan']),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final data = Get.arguments;
                      Get.toNamed('/jadwal', arguments: data);
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit"),
                  ),
                ),

    const SizedBox(width: 10),

    Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
          final data = Get.arguments;

          Get.defaultDialog(
            title: "Hapus",
            middleText: "Yakin ingin menghapus?",
            textConfirm: "Ya",
            textCancel: "Batal",
            onConfirm: () {
              Get.find<JadwalController>()
                  .deleteJadwal(data['id']);
            },
          );
        },
        icon: const Icon(Icons.delete),
        label: const Text("Hapus"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
      ),
    ),
  ],
),

            const Spacer(),

            // BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Kembali"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            )
          ],
        ),
        
        
      ),
    );
  }

  // WIDGET ITEM
  Widget buildItem(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
    
  }
}