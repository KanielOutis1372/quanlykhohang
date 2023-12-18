import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/ware_house_model.dart';
import '../data/services_api/data_list_service.dart';
import '../data/services_api/url_api.dart';

class WareHouseController extends GetxController {
  final dataListService = Get.put(DataListService());
  final RxList<Warehouse> wareHouses = <Warehouse>[].obs;
  Future<void> fetchDataAPI() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final data = await dataListService.fetchData(token, UrlAPI.warehouseListAPI);
    if (data['data'] != null) {
      data['data'].forEach((v) {
        wareHouses.add(Warehouse.fromJson(v));
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataAPI();
  }
}
