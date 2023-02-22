import 'package:news_app/app/controllers/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Setting"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Dark mode"),
                const Spacer(),
                Obx(
                  () => CupertinoSwitch(
                    value: controller.isDark.value,
                    onChanged: (value) {
                      controller.darkModeSwitch(value);
                      Get.changeTheme(
                        value ? ThemeData.light() : ThemeData.dark(),
                      );
                    },
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {
                Get.offAllNamed('/login');
              },
              color: Colors.grey[300],
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueAccent,
  primarySwatch: Colors.blue,
);

final ThemeData darkAppThemeData = ThemeData(
  primaryColor: Colors.blueGrey,
);
