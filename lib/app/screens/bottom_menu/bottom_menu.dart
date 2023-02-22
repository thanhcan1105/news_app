import 'package:news_app/app/controllers/home_controller.dart';
import 'package:news_app/app/screens/home_screen/home_screen.dart';
import 'package:news_app/app/screens/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenu extends GetView<HomeController> {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      HomeScreen(),
      SettingScreen(),
    ];
    return Scaffold(
      body: Obx(
        () => Container(
          child: listWidget.elementAt(controller.selectedIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: (value) {
            controller.selectedBottomBar(value);
          },
          // selectedFontSize: 15,
          selectedIconTheme: const IconThemeData(
            color: Colors.amberAccent,
            size: 30,
          ),
          selectedItemColor: Colors.amberAccent,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          mouseCursor: SystemMouseCursors.grab,
        ),
      ),
    );
  }
}
