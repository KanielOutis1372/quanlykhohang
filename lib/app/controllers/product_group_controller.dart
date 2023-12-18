import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/product_group_model.dart';
import '../data/services_api/data_list_service.dart';
import '../data/services_api/url_api.dart';

class ProductGroupController extends GetxController {
  final dataListService = Get.put(DataListService());
  final RxList<ProductGroup> productGroups = <ProductGroup>[].obs;

  Future<void> fetchDataAPI() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final data = await dataListService.fetchData(token, UrlAPI.productGroupListAPI);
    if (data['data'] != null) {
      data['data'].forEach((v) {
        productGroups.add(ProductGroup.fromJson(v));
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataAPI();
  }
}
