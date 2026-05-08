import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'package:sekolah/app/modules/jadwal/controllers/jadwal_controller.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(JadwalController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Praktikum Mobile Dev',
      debugShowCheckedModeBanner: false,  // ✅ HAPUS DEBUG BANNER!
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,  // Modern Material 3
        fontFamily: 'Roboto',
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}