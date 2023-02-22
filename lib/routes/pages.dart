import 'package:news_app/app/bindings/details_binding.dart';
import 'package:news_app/app/bindings/home_binding.dart';
import 'package:news_app/app/bindings/login_binding.dart';
import 'package:news_app/app/bindings/register_binding.dart';
import 'package:news_app/app/bindings/setting_binding.dart';
import 'package:news_app/app/bindings/splash_binding.dart';
import 'package:news_app/app/screens/auth_screen/login_screen.dart';
import 'package:news_app/app/screens/auth_screen/register_screen.dart';
import 'package:news_app/app/screens/details_screen/dertails_screen.dart';
import 'package:news_app/app/screens/bottom_menu/bottom_menu.dart';
import 'package:news_app/app/screens/home_screen/home_screen.dart';
import 'package:news_app/app/screens/news_detail/news_detail.dart';
import 'package:news_app/app/screens/setting_screen/setting_screen.dart';
import 'package:news_app/app/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/',
      binding: SplashBinding(),
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/bottom_menu',
      binding: HomeBinding(),
      page: () => const BottomMenu(),
    ),
    GetPage(
      name: '/home',
      binding: HomeBinding(),
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/login',
      binding: LoginBinding(),
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/register',
      binding: RegisterBinding(),
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: '/details',
      binding: DetailsBinding(),
      page: () => DetailsScreen(),
    ),
    GetPage(
      name: '/setting',
      binding: SettingBinding(),
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: '/detail',
      binding: HomeBinding(),
      page: () => const NewsDetialScreen(),
    ),
  ];
}
