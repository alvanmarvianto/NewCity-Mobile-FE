import 'package:get/get.dart';

import '../controllers/histori_laporan_controller.dart';

class DetailLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriLaporanController>(
      () => HistoriLaporanController(),
    );
  }
}
