import 'package:get/get.dart';

// ignore: unused_import
import '../controllers/laporan_saya_controllers.dart';

class LaporanSayaController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanSayaController>(
      () => LaporanSayaController(),
    );
  }
}
