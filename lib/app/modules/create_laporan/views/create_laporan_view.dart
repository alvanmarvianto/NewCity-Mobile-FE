import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_laporan_controller.dart';

class CreateLaporanView extends GetView<CreateLaporanController> {
  const CreateLaporanView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAnonim = false;
    final CreateLaporanController controller =
        Get.put(CreateLaporanController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Buat Laporan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Data Diri", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 18),
            Text("Nama"),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan nama",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF588157), width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 18),
            Text("Nomor Telepon"),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan nomor telepon",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF588157), width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 18),
            Text("Email"),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan email",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF588157), width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Checkbox(value: isAnonim, onChanged: (bool? value) {}),
                Text("Buat laporan sebagai anonim"),
              ],
            ),
            SizedBox(height: 20),
            Text("Laporan", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 18),
            Text("Judul"),
            TextField(
              controller: controller.judulController,
              decoration: InputDecoration(
                hintText: "Masukkan judul laporan",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF588157), width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 18),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF588157), width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(onTap: () async {
                // buka kamera
                await controller.openCamera();
              }, child: Obx(() {
                if (controller.photo.value != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(controller.photo.value!.path),
                      fit: BoxFit.contain, // atur gambar di container
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: Colors.green),
                      Text("Unggah gambar/video"),
                    ],
                  );
                }
              })),
            ),
            SizedBox(height: 20),
            Text("Lokasi"),
            TextField(
              controller: controller.lokasiController,
              decoration: InputDecoration(
                hintText: "Masukkan lokasi",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF588157), width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 18),
            Text("Deskripsi"),
            TextField(
              controller: controller.deskripsiController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Masukkan detail dari laporan mu disini",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF588157), width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            Text("Pilih Topik", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                _buildTopicChip("Keamanan"),
                _buildTopicChip("Lalu Lintas"),
                _buildTopicChip("Kebersihan"),
                _buildTopicChip("Infrastruktur"),
                _buildTopicChip("Banjir"),
                _buildTopicChip("Jalan Rusak"),
                _buildTopicChip("Transportasi Umum"),
                _buildTopicChip("Kehilangan"),
                _buildTopicChip("Lainnya..."),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.postReport();
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color(0xFF588157)),
              child: Text(
                "Berikutnya",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicChip(String label) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(color: Color(0xFF588157)),
      ),
      selected: false,
      onSelected: (bool selected) {},
      backgroundColor: Colors.white,
      selectedColor: Colors.green,
      labelStyle: TextStyle(color: Colors.black),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}