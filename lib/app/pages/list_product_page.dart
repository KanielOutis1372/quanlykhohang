// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:quanlykhohang/app/config/app_routes.dart';
import 'package:quanlykhohang/app/data/models/product_group_model.dart';
import 'package:quanlykhohang/app/data/models/product_model.dart';
import 'package:quanlykhohang/app/data/models/ware_house_model.dart';
import '../controllers/product_controller.dart';
import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';
import '../widgets/product_card.dart';

class ListProductPage extends GetView<ProductController> {
  const ListProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    final MultiSelectController<ProductGroup> _productGroupCtrl =
        MultiSelectController();
    final MultiSelectController<Warehouse> _warehouseCtrl =
        MultiSelectController();

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
                  "Danh sách hàng hóa",
                  style: TextStyle(
                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                      color: MyConfig.SECONDARY_COLOR,
                      fontWeight: MyConfig.semiBold),
                ),
                SizedBox(
                  height: MyConfig.PADDING_PAGE.toDouble(),
                ),
                Obx(
                  () {
                    if (controller.products.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          Obx(
                            () => ProductCard(
                              data: controller.totalQuality.value,
                              nameCard: "Tổng mặt hàng",
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Obx(
                            () => ProductCard(
                              data: controller.totalPrice.value,
                              nameCard: "Tồn kho",
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          DecoratedBox(
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
                            child: Form(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Obx(
                                    () => MultiSelectDropDown(
                                      hintStyle: TextStyle(
                                        fontSize: MyConfig
                                                .PRIMARY_FONT_SIZE_TEXT
                                                .toDouble() -
                                            3,
                                        color: MyConfig.SECONDARY_COLOR,
                                      ),
                                      hint: "Chọn nhóm",
                                      showClearIcon: true,
                                      controller: _productGroupCtrl,
                                      onOptionSelected: (options) {
                                        debugPrint(options.toString());
                                      },
                                      options: controller.productGroups
                                          .map((item) =>
                                              ValueItem<ProductGroup>(
                                                  label:
                                                      item.groupName.toString(),
                                                  value: item))
                                          .toList(),
                                      maxItems: controller.productGroups.length,
                                      selectionType: SelectionType.multi,
                                      chipConfig: const ChipConfig(
                                          wrapType: WrapType.wrap),
                                      dropdownHeight: 300,
                                      optionTextStyle:
                                          const TextStyle(fontSize: 16),
                                      selectedOptionIcon:
                                          const Icon(Icons.check_circle),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Obx(
                                    () => MultiSelectDropDown(
                                      hintStyle: TextStyle(
                                        fontSize: MyConfig
                                                .PRIMARY_FONT_SIZE_TEXT
                                                .toDouble() -
                                            3,
                                        color: MyConfig.SECONDARY_COLOR,
                                      ),
                                      hint: "Chọn kho",
                                      showClearIcon: true,
                                      controller: _warehouseCtrl,
                                      onOptionSelected: (options) {
                                        debugPrint(options.toString());
                                      },
                                      options: controller.wareHouses
                                          .map((item) => ValueItem<Warehouse>(
                                              label: item.fullname.toString(),
                                              value: item))
                                          .toList(),
                                      maxItems: controller.wareHouses.length,
                                      selectionType: SelectionType.multi,
                                      chipConfig: const ChipConfig(
                                          wrapType: WrapType.wrap),
                                      dropdownHeight: 300,
                                      optionTextStyle:
                                          const TextStyle(fontSize: 16),
                                      selectedOptionIcon:
                                          const Icon(Icons.check_circle),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(MyConfig
                                                .PRIMARY_COLOR), // Màu nền khi không được nhấn
                                        overlayColor: MaterialStateProperty
                                            .all<Color>(Colors
                                                .grey), // Màu nền khi được nhấn
                                        // Các thuộc tính khác của ButtonStyle
                                      ),
                                      child: Text(
                                        "Lọc",
                                        style: TextStyle(
                                          fontSize: MyConfig
                                              .PRIMARY_FONT_SIZE_TEXT
                                              .toDouble(),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          DecoratedBox(
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
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Tìm kiếm',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  onChanged: (value) {},
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                PaginatedDataTable(
                                  actions: [
                                    ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                      ),
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_downward_sharp,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            "Xuất FILE",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => Get.offAllNamed(
                                          AppRoutes.add_product),
                                      child: const Text("Thêm hàng"),
                                    )
                                  ],
                                  header: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      "Thông tin",
                                      style: TextStyle(
                                        fontSize: MyConfig
                                                .PRIMARY_FONT_SIZE_TEXT
                                                .toDouble() +
                                            3,
                                        fontWeight: MyConfig.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "Các mặt hàng trong kho!",
                                      style: TextStyle(
                                        fontSize: MyConfig.SECOND_FONT_SIZE_TEXT
                                                .toDouble() +
                                            1,
                                      ),
                                    ),
                                  ),
                                  columns: const [
                                    DataColumn(label: Text('STT')),
                                    DataColumn(label: Text('Mã hàng')),
                                    DataColumn(label: Text('Tên hàng')),
                                    DataColumn(label: Text('Giá mua')),
                                    DataColumn(label: Text('Giá bán')),
                                    DataColumn(label: Text('Màu sắc')),
                                    DataColumn(label: Text('Tồn kho')),
                                    DataColumn(label: Text('BH')),
                                    DataColumn(label: Text('Nhóm')),
                                    DataColumn(label: Text('Đã bán')),
                                    DataColumn(label: Text('Đã nhập')),
                                    DataColumn(label: Text('Hoạt động')),
                                  ],
                                  sortColumnIndex: 0,
                                  sortAscending: true,
                                  source: UserDataTableSourceProduct(
                                      controller.products, context),
                                  // onPageChanged: (pageIndex) {},
                                  // onRowsPerPageChanged: (rowsPerPage) {},
                                  showCheckboxColumn: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDataTableSourceProduct extends DataTableSource {
  final RxList<Product> products;
  final BuildContext context;
  UserDataTableSourceProduct(this.products, this.context);

  @override
  DataRow getRow(int index) {
    final product = products[index];
    return DataRow(
      selected: false,
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(product.code.toString())),
        DataCell(Text(product.name.toString())),
        DataCell(Text(product.buyPrice.toString())),
        DataCell(Text(product.salePrice.toString())),
        DataCell(Text(product.color.toString())),
        DataCell(Text(product.stock.toString())),
        DataCell(Text(product.active.toString())),
        DataCell(Text(product.productGroupsName.toString())),
        DataCell(Text(product.sellQuality.toString())),
        DataCell(Text(product.purchaseQuality.toString())),
        DataCell(Text(product.active.toString())),
      ],
      onSelectChanged: (_) => print(
          'Row $index tapped: ${products[index].id} - ${products[index].name} - ${products[index].color}'),
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
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}
