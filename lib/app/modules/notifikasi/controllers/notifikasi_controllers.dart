import 'package:get/get.dart';

class NotifikasiController extends GetxController {
  var notifikasiList = <Map<String, String>>[
    {
      'nama': 'Roti Sari Roti',
      'pesan': 'berkomentar : Ini akan dibenahi tanggal 10 Juni nanti mas.',
      'waktu': '10 Menit',
      'tipe': 'baru',
      'foto': '', // URL foto profile
    },
    {
      'nama': 'Roti Sari Roti',
      'pesan': 'berkomentar : Ini akan dibenahi tanggal 10 Juni nanti mas.',
      'waktu': '10 Menit',
      'tipe': 'baru',
      'foto': '', // URL foto profile
    },
    {
      'nama': 'Roti Sari Roti',
      'pesan': 'menyukai laporan anda',
      'waktu': '22 Jam',
      'tipe': 'kemarin',
      'foto': '', // URL foto profile
    },
    {
      'nama': 'Roti Sari Roti',
      'pesan': 'berkomentar : Ini akan dibenahi tanggal 10 Juni nanti mas.',
      'waktu': '22 Jam',
      'tipe': 'kemarin',
      'foto': '', // URL foto profile
    },
    {
      'nama': 'Roti Sari Roti',
      'pesan': 'berkomentar : Ini akan dibenahi tanggal 10 Juni nanti mas.',
      'waktu': '1 Hari',
      'tipe': 'kemarin',
      'foto': '', // URL foto profile
    },
  ].obs;

  void goToLaporanSaya() {
    // Navigasi ke halaman "Laporan Saya"
    Get.toNamed('/laporan-saya');
  }
}
