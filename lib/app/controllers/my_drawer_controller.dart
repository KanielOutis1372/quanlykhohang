import 'package:get/get.dart';
import 'package:quanlykhohang/app/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawerController extends GetxController {
  final fullname = ''.obs;
  final email = ''.obs;
  void getInfor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    fullname.value = prefs.getString("fullname")!;
    email.value = prefs.getString("email")!;
  }

  @override
  void onInit() {
    super.onInit();
    getInfor();
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("username");
    prefs.remove("email");

    Get.offAllNamed('/login');
    Get.put(LoginController());
  }
}
