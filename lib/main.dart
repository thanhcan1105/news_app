import 'package:news_app/app/bindings/splash_binding.dart';
import 'package:news_app/app/controllers/setting_controller.dart';
import 'package:news_app/app/screens/splash_screen/splash_screen.dart';
import 'package:news_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/themes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

SettingController settingController = Get.put(SettingController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: SplashBinding(),
      initialRoute: '/',
      getPages: AppPages.pages,
      themeMode:
          settingController.isDark.value ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(),
      darkTheme: ThemeData(textTheme: Typography.blackCupertino),
      home: const SplashScreen(),
    );
  }
}
