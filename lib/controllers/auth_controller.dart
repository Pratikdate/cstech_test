
import 'dart:convert';

import 'package:cstech_test/presentation/home_screen.dart';
import 'package:cstech_test/presentation/login_screen.dart';
import 'package:cstech_test/presentation/otp_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/datasource/authSource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  var number="".obs;

  final storage = FlutterSecureStorage();


  Future<void> readStoredNumber() async {

    number.value= await storage.read(key: 'user_number')??"";

    print(number.value);
  }


  List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());

  String get otp =>
      otpControllers.map((controller) => controller.text).join();

  void clearOtp() {
    for (var controller in otpControllers) {
      controller.clear();
    }
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.onClose();
  }



  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final res = await AuthService.login( email: email, password: password);
    isLoading.value = false;

    if (res.statusCode == 200) {
      print(res.body);
      final responseData = jsonDecode(res.body);
      await storage.write(key: 'user_Id', value: responseData["user"]["_id"].toString());

      await storage.write(key: 'user_email', value: email);

      Get.snackbar('Success', 'Logged in');
      readStoredNumber();
      await sendOtp(email);





    } else {
      Get.snackbar('Error', 'Login failed');
    }
  }

  Future<void> register(String username, String email, String password,String whNumber, String number) async {
    isLoading.value = true;
    final res = await AuthService.register(username: username, email: email, password: password);
    isLoading.value = false;

    print(res.body);
    print(res.statusCode);
    final jsonRes=jsonDecode(res.body);
    if (res.statusCode == 201) {

      Get.snackbar('Success', 'Registered successfully');

      await storage.write(key: 'user_name', value: username);
      await storage.write(key: 'user_email', value: email);
      await storage.write(key: 'user_whNumber', value: whNumber);
      await storage.write(key: 'user_number', value: number);
      Get.off(LoginScreen());
    } else {
      Get.snackbar('Error',jsonRes['message']);
    }
  }

  Future<void> sendOtp(String email) async {
    isLoading.value = true;

    print(email);
    final res = await AuthService.sendOtp(email: email);
    isLoading.value = false;

    final responseData = jsonDecode(res.body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      Get.snackbar('Success', 'OTP sent');
      Get.off(OTPVerificationScreen());
    }else if(res.statusCode==400){
      Get.snackbar('Success', responseData["message"]);
      Get.off(HomeScreen());
    }
    else {
      Get.snackbar('Error', responseData["message"]);
    }
  }


  Future<void> verifyOTP() async {
    isLoading.value = true;
    String? email = await storage.read(key: 'user_email');

    final res = await AuthService.verifyOtp(email: email??"",otp: otp);
    isLoading.value = false;

    if (res.statusCode == 200) {
      print(res);
      Get.snackbar('Success', 'OTP Verify');
      Get.off(HomeScreen());
    } else {
      Get.snackbar('Error', 'OTP Failed to Verify');
    }
  }
}
