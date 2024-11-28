import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/model.dart';

class ListBeritaController extends GetxController {
  var allBerita = Rx<BeritaResponsePagination>(BeritaResponsePagination());
  var allKategori = Rx<KategoriBeritaResponse>(KategoriBeritaResponse());
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBerita();
    fetchKategori();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Fetch Berita data from the API
  void fetchBerita() async {
    try {
      var response = await ApiService.getPaginationBerita();
      allBerita.value = response!;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }

  void fetchKategori() async {
    try {
      var response = await ApiService.getKategori();
      allKategori.value = response!;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }
}
