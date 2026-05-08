import 'package:get/get.dart';

import '../controllers/jadwal_detail_controller.dart';

class JadwalDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalDetailController>(
      () => JadwalDetailController(),
    );
  }
}
