import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:sekolah/app/modules/jadwal/controllers/jadwal_controller.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Jadwal Kuliah"),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/youtube'),
            icon: const Icon(Icons.play_circle),
          ),
        ],
      ),

      body: Obx(() {
        if (controller.schedules.isEmpty) {
          return const Center(
            child: Text("Belum ada jadwal"),
          );
        }

        return ListView.builder(
          itemCount: controller.schedules.length,
          itemBuilder: (context, index) {
            final data = controller.schedules[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.book),

                onTap: () {
                  Get.toNamed('/jadwal-detail', arguments: data);
                },

                title: Text(
                  data['matkul'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dosen: ${data['dosen']}"),
                    Text("${data['hari']} • ${data['jam']}"),
                  ],
                ),

                trailing: Text(
                  data['ruangan'],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final c = Get.find<JadwalController>();
          c.resetForm();
          Get.toNamed('/jadwal');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
