import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/jadwal_detail/bindings/jadwal_detail_binding.dart';
import '../modules/jadwal_detail/views/jadwal_detail_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/youtube/bindings/youtube_binding.dart';
import '../modules/youtube/views/youtube_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
        name: '/splash', page: () => SplashView(), binding: SplashBinding()),
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/register',
      page: () => RegisterView(),
      binding: RegisterBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/forgot-password',
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(name: '/home', page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: Routes.JADWAL,
      page: () => const JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: Routes.JADWAL_DETAIL,
      page: () => const JadwalDetailView(),
      binding: JadwalDetailBinding(),
    ),
    GetPage(
      name: Routes.YOUTUBE,
      page: () => const YoutubeView(),
      binding: YoutubeBinding(),
    ),
  ];
}
