import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlykhohang/app/config/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/user_model.dart';
import '../data/services_api/auth_service.dart';
import 'home_controller.dart';

class LoginController extends GetxController {
  final _obscurePassword = false.obs;
  final _username = ''.obs;
  late final _password = ''.obs;
  final authService = Get.put(AuthService());

  get obscurePassword => _obscurePassword.value;

  get username => _username;

  set username(value) {
    _username.value = value;
  }

  get password => _password;

  set password(value) {
    _password.value = value;
  }

  void login() async {
    final resp = await authService.login(_username.value, _password.value);
    if (resp.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final loginInfor = UserModel.fromJson(json.decode(resp.body));
      await prefs.setString("token", loginInfor.token ?? "");
      await prefs.setString("fullname", loginInfor.user?.fullname ?? "");
      await prefs.setString("email", loginInfor.user?.email ?? "");
      Get.offNamed(AppRoutes.home);
      Get.put(HomeController());
      Get.snackbar(
        "SUCCESS",
        "LOGIN SUCCESS!",
        colorText: Colors.yellow,
        backgroundColor: Colors.green,
      );
    } else if(resp.statusCode == 401) {
      Get.snackbar(
        "ERROR",
        json.decode(resp.body)['message'],
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    else {
      Get.snackbar(
        "ERROR",
        "SERVER ERROR!",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<bool> hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void togglePassword() {
    _obscurePassword.value = !_obscurePassword.value;
  }
}
