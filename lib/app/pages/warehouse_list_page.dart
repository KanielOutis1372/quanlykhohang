import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlykhohang/app/controllers/warehouse_list_controller.dart';
import 'package:quanlykhohang/app/data/models/ware_house_model.dart';

import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class WareHouseListPage extends GetView<WareHouseController> {
  const WareHouseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WareHouseController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyConfig.MY_BACKGROUND_COLOR,
        appBar: const MyAppBar(),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MyConfig.PADDING_PAGE.toDouble()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Danh sách kho",
                  style: TextStyle(
                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                      color: MyConfig.SECONDARY_COLOR,
                      fontWeight: MyConfig.semiBold),
                ),
                SizedBox(
                  height: MyConfig.PADDING_PAGE.toDouble(),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Thêm kho hàng mới",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: MyConfig.bold,
                            fontSize:
                                MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 4,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: Colors.grey[300],
                          height: 20,
                          thickness: 0.6,
                          indent: 0,
                          endIndent: 2,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Tên NPP",
                                style: TextStyle(
                                  fontWeight: MyConfig.bold,
                                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                          .toDouble() +
                                      1,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: "Tên NPP"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Số điện thoại",
                                style: TextStyle(
                                  fontWeight: MyConfig.bold,
                                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                          .toDouble() +
                                      1,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: "Số điện thoại"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Địa chỉ",
                                style: TextStyle(
                                  fontWeight: MyConfig.bold,
                                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                          .toDouble() +
                                      1,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: "Địa chỉ"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyConfig
                                      .PRIMARY_COLOR), // Màu nền khi không được nhấn
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.grey), // Màu nền khi được nhấn
                              // Các thuộc tính khác của ButtonStyle
                            ),
                            child: Text(
                              "Lưu thông tin",
                              style: TextStyle(
                                fontSize:
                                    MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Obx(() {
                  if (controller.wareHouses.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: PaginatedDataTable(
                        header: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Danh sách kho hàng",
                            style: TextStyle(
                              fontSize:
                                  MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() +
                                      3,
                              fontWeight: MyConfig.bold,
                            ),
                          ),
                        ),
                        columns: const [
                          DataColumn(label: Text('STT')),
                          DataColumn(label: Text('Tên kho')),
                          DataColumn(label: Text('SĐT')),
                          DataColumn(label: Text('Địa chỉ')),
                        ],
                        source: UserDataTableSourceWareHouseList(
                            controller.wareHouses, context),
                        // onPageChanged: (pageIndex) {},
                        // onRowsPerPageChanged: (rowsPerPage) {},
                        showCheckboxColumn: false,
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDataTableSourceWareHouseList extends DataTableSource {
  final RxList<Warehouse> wareHouses;
  final BuildContext context;
  UserDataTableSourceWareHouseList(this.wareHouses, this.context);

  @override
  DataRow getRow(int index) {
    final wareHouse = wareHouses[index];
    return DataRow(
      selected: false,
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(wareHouse.fullname.toString())),
        DataCell(Text(wareHouse.fullname.toString())),
        DataCell(Text(wareHouse.fullname.toString())),
      ],
      onSelectChanged: (_) => print(
          'Row $index tapped: ${wareHouses[index].id} - ${wareHouses[index].fullname} - ${wareHouses[index].fullname}'),
      onLongPress: () => showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(onPressed: () {}, child: const Text("Cancel")),
            TextButton(onPressed: () {}, child: const Text("Ok"))
          ],
          title: const Text("Are you sure delete this?"),
        ),
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => wareHouses.length;

  @override
  int get selectedRowCount => 0;
}
