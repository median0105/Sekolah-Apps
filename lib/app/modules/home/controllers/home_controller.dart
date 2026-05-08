import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<Map<String, dynamic>> schedules = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    firestore.collection('jadwal').snapshots().listen((snapshot) {
      schedules.value = snapshot.docs.map((doc) {
        final data = doc.data();

        return {
          "id": doc.id,
          "matkul": data["matkul"] ?? "",
          "dosen": data["dosen"] ?? "",
          "hari": data["hari"] ?? "",
          "jam": data["jam"] ?? "",
          "ruangan": data["ruangan"] ?? "",
        };
      }).toList();
    });
  }
}