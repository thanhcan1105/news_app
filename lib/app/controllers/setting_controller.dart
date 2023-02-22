import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  RxBool isDark = false.obs;
  RxBool isLoading = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    if (box.read("darkmode")) {
      isDark.value = box.read("darkmode");
    }
    super.onInit();
  }

  void darkModeSwitch(value) {
    isDark.value = value;
    box.write("darkmode", value);
  }
}
