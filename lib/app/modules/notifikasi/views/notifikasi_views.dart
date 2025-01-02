import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notifikasi_controllers.dart';

class NotifikasiView extends StatelessWidget {
  final NotifikasiController controller = Get.put(NotifikasiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Notifikasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () => controller.goToLaporanSaya(),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  'Laporan Saya',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        final baru = controller.notifikasiList
            .where((notifikasi) => notifikasi['tipe'] == 'baru')
            .toList();
        final kemarin = controller.notifikasiList
            .where((notifikasi) => notifikasi['tipe'] == 'kemarin')
            .toList();

        return ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            if (baru.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terbaru',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  ...baru.map((notifikasi) => NotifikasiItem(notifikasi)),
                ],
              ),
            if (kemarin.isNotEmpty) ...[
              SizedBox(height: 16),
              Text(
                'Kemarin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              ...kemarin.map((notifikasi) => NotifikasiItem(notifikasi)),
            ],
          ],
        );
      }),
    );
  }
}

class NotifikasiItem extends StatelessWidget {
  final Map<String, String> notifikasi;

  const NotifikasiItem(this.notifikasi);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.green,
            backgroundImage: notifikasi['foto']?.isNotEmpty == true
                ? NetworkImage(notifikasi['foto']!)
                : null,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '${notifikasi['nama']} ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: notifikasi['pesan']),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  notifikasi['waktu']!,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
