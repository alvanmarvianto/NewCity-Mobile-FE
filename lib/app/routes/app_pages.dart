import 'package:get/get.dart';

import '../modules/biodata_page/bindings/biodata_page_binding.dart';
import '../modules/biodata_page/views/biodata_page_view.dart';
import '../modules/detail_berita/bindings/detail_berita_binding.dart';
import '../modules/detail_berita/views/detail_berita_view.dart';
<<<<<<< Updated upstream
import '../modules/edit_akun/bindings/edit_akun_binding.dart';
import '../modules/edit_akun/views/edit_akun_view.dart';
import '../modules/goverment/bindings/goverment_binding.dart';
import '../modules/goverment/views/goverment_view.dart';
=======
import '../modules/detail_laporan/bindings/detail_laporan_binding.dart';
import '../modules/detail_laporan/views/detail_laporan_view.dart';
//import '../modules/edit_akun/bindings/edit_akun_binding.dart';
//import '../modules/biodata_page/views/edit_akun_view.dart';
import '../modules/government/bindings/government_binding.dart';
import '../modules/government/views/government_view.dart';
>>>>>>> Stashed changes
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_berita/bindings/list_berita_binding.dart';
import '../modules/list_berita/views/list_berita_view.dart';
import '../modules/list_topik_berita/bindings/list_topik_berita_binding.dart';
import '../modules/list_topik_berita/views/list_topik_berita_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/topik_berita/bindings/topik_berita_binding.dart';
import '../modules/topik_berita/views/topik_berita_view.dart';
import '../modules/welcomepage/bindings/welcomepage_binding.dart';
import '../modules/welcomepage/views/welcomepage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BIODATA_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LIST_BERITA,
      page: () => const ListBeritaView(),
      binding: ListBeritaBinding(),
    ),
    GetPage(
      name: _Paths.LIST_TOPIK_BERITA,
      page: () => const ListTopikBeritaView(),
      binding: ListTopikBeritaBinding(),
    ),
    GetPage(
      name: _Paths.TOPIK_BERITA,
      page: () => const TopikBeritaView(),
      binding: TopikBeritaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BERITA,
      page: () => const DetailBeritaView(),
      binding: DetailBeritaBinding(),
    ),
    GetPage(
      name: _Paths.WELCOMEPAGE,
      page: () => WelcomepageView(),
      binding: WelcomepageBinding(),
    ),
    GetPage(
      name: _Paths.GOVERMENT,
      page: () => GovermentView(),
      binding: GovermentBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BIODATA_PAGE,
      page: () => const BiodataPageView(),
      binding: BiodataPageBinding(),
    ),
    /*GetPage(
      name: _Paths.EDIT_AKUN,
      page: () => const EditAkunView(),
      binding: EditAkunBinding(),
<<<<<<< Updated upstream
=======
    ),*/
    GetPage(
      name: _Paths.CREATE_LAPORAN,
      page: () => const CreateLaporanView(),
      binding: CreateLaporanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PENCARIAN_LAPORAN,
      page: () => const ListPencarianLaporanView(),
      binding: ListPencarianLaporanBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LAPORAN,
      page: () => DetailLaporanView(),
      binding: DetailLaporanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_LAPORAN,
      page: () => const ListLaporanView(),
      binding: ListLaporanBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA,
      page: () => const BerandaView(),
      binding: BerandaBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: RegisterBinding(),
>>>>>>> Stashed changes
    ),
  ];
}
