
import 'dart:convert';

import 'package:cstech_test/presentation/home_screen.dart';
import 'package:cstech_test/presentation/login_screen.dart';
import 'package:cstech_test/presentation/otp_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/datasource/authSource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data/datasource/listDataSource.dart';



class DashboardController extends GetxController {

  final isLoading     = false.obs;




  Future<dynamic> fetchListId() async {

    isLoading.value = true;

    final storage = FlutterSecureStorage();
    String? id= await storage.read(key: 'user_Id');
    String? email= await storage.read(key: 'user_email');


    final res = await fetchLists(userId:id.toString(), email: email.toString());
    isLoading.value = false;

    if (res.statusCode == 200) {
      print(res.body);
      final jsonData=jsonDecode(res.body);


      Get.snackbar('Success', ' Data Loaded');
      return fetchCallListStats( listId: jsonData["_id"], email: email.toString());

    } else {
      Get.snackbar('Error', ' failed to load data.');
    }

  }
}