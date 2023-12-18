import 'package:get/get.dart';
import 'package:quanlykhohang/app/data/models/product_model.dart';

import '../data/services_api/data_list_service.dart';

class ImportProductController extends GetxController {
  final dataListService = Get.put(DataListService());
  final product = Product();
}
