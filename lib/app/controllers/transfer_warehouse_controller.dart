import 'package:get/get.dart';

import '../data/models/ware_house_model.dart';
import '../data/services_api/data_list_service.dart';

class TransferWareHouseController extends GetxController {
  final dataListService = Get.put(DataListService());
  final RxList<Warehouse> wareHouses = <Warehouse>[].obs;
}