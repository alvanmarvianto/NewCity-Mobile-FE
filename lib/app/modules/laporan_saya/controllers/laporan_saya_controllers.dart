// File: controller/laporan_saya_controller.dart
import 'package:get/get.dart';

class LaporanSayaController extends GetxController {
  var searchQuery = ''.obs;

  final List<Map<String, dynamic>> laporanData = [
    {
      'title':
          'Bukannya Berkurang, Sampah dari Kota Bandung ke Sarimukti Justru Melonjak!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et ...',
      'author': 'Anonymous',
      'status': 'Dalam Proses',
    },
    {
      'title': 'Banjir Bandang di Kawasan Braga, 150 Orang Dievakuasi!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et ...',
      'author': 'Anonymous',
      'status': 'Tindak Lanjut',
    },
    {
      'title': 'Jalan Buah-batu dan Telkom University Selalu MACET!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et ...',
      'author': 'Anonymous',
      'status': 'Tindak Lanjut',
    },
  ];

  List<Map<String, dynamic>> get filteredLaporanData {
    if (searchQuery.value.isEmpty) {
      return laporanData;
    } else {
      return laporanData
          .where((laporan) => laporan['title']
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void navigateToHistory() {
    Get.toNamed('/histori');
  }
}
