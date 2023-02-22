import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/auth_services.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onSubmited() async {
    isSubmitting.value = true;
    isEnableSubmit.value = false;
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Map<String, String> data = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      var response = await AuthService().register(data: data);
      print(response);
      var deviceToken = "";

      if (response != null) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        Get.offAllNamed('login');
        // notify.success(message: 'Đăng nhập thành công!!', title: 'Thành công');
        isSubmitting.value = true;
      } else {
        Get.back();
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        // notify.error(message: 'Đăng nhập thất bại!!', title: 'Thất bại');
      }
    }
  }
}
