import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/auth_services.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isEnableSubmit = false.obs;
  RxBool isSubmitting = false.obs;
  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();

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
      var response = await AuthService().login(data: data);
      var deviceToken = "";

      if (response != null) {
        isSubmitting.value = false;
        isEnableSubmit.value = true;
        box.write('token', response['token']);
        box.write('deviceToken', deviceToken);
        box.writeInMemory('accountMemory', emailController.text);
        Get.offAllNamed('bottom_menu');
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
