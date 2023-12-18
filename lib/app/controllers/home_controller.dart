import 'package:get/get.dart';
import 'package:quanlykhohang/app/config/app_routes.dart';
import 'package:quanlykhohang/app/data/services_api/data_list_service.dart';
import 'package:quanlykhohang/app/data/services_api/url_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_controller.dart';

class HomeController extends GetxController {
  final dataListService = Get.put(DataListService());
  late RxMap<String, dynamic> cardDatas;
  RxBool isLoading = true.obs;

  final RxMap<String, String> cardColors = {
    'totalSales': '#536dfe',
    'totalOrder': '#11c15b',
    'totalSalesSPK': '#ff5252',
    'totalPrice': '#d7c7c7',
    'totalStaffDebt': '#1c1a1a',
    'totalCustomerDebt': '#464495'
  }.obs;

  // final RxMap<String, dynamic> cardDatas = {
  //   "totalSales": 9665735,
  //   "totalOrder": 7,
  //   "totalSalesSPK": '1316500',
  //   "totalPrice": null,
  //   "totalStaffDebt": "26508624",
  //   "totalCustomerDebt": "231974",
  // }.obs;

  final RxMap<String, dynamic> cardNames = {
    "totalSales": "Doanh số tháng (cả hàng ngoài)",
    "totalOrder": "Đơn hàng trong tháng",
    "totalSalesSPK": "Doanh số tháng (Sopoka)",
    "totalPrice": "Tổng số tiền nhập trong tháng",
    "totalStaffDebt": "Công nợ nhân viên",
    "totalCustomerDebt": "Công nợ khách hàng",
  }.obs;

  void initCardData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final data = await dataListService.fetchData(token, UrlAPI.homeListAPI);
    cardDatas.assignAll(data);
    cardDatas['totalSalesSPK'] = '1316500';
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    cardDatas = <String, dynamic>{}.obs;
    initCardData();
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("username");
    prefs.remove("email");

    Get.offAllNamed(AppRoutes.login);
    Get.put(LoginController());
  }
}
