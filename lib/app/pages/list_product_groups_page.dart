import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlykhohang/app/config/app_routes.dart';
import '../controllers/product_group_controller.dart';
import '../data/models/my_config.dart';
import '../data/models/product_group_model.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class ListProductGroupsPage extends GetView<ProductGroupController> {
  const ListProductGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductGroupController());
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
                  "Danh sách nhóm hàng",
                  style: TextStyle(
                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                      color: MyConfig.SECONDARY_COLOR,
                      fontWeight: MyConfig.semiBold),
                ),
                SizedBox(
                  height: MyConfig.PADDING_PAGE.toDouble(),
                ),
                Obx(() {
                  if (controller.productGroups.isEmpty) {
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
                        actions: [
                          ElevatedButton(
                            onPressed: () =>
                                Get.offAllNamed(AppRoutes.add_product_group),
                            child: const Text("Thêm nhóm hàng"),
                          )
                        ],
                        header: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Thông tin",
                            style: TextStyle(
                              fontSize:
                                  MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() +
                                      3,
                              fontWeight: MyConfig.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Các nhóm hàng trong kho!",
                            style: TextStyle(
                              fontSize:
                                  MyConfig.SECOND_FONT_SIZE_TEXT.toDouble() + 1,
                            ),
                          ),
                        ),
                        columns: const [
                          DataColumn(label: Text('STT')),
                          DataColumn(label: Text('Mã nhóm')),
                          DataColumn(label: Text('Tên nhóm')),
                          DataColumn(label: Text('Mô tả')),
                          DataColumn(label: Text('Cách tính')),
                        ],
                        source: UserDataTableSourceProductGroup(
                            controller.productGroups, context),
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

class UserDataTableSourceProductGroup extends DataTableSource {
  final RxList<ProductGroup> productGroups;
  final BuildContext context;
  UserDataTableSourceProductGroup(this.productGroups, this.context);

  @override
  DataRow getRow(int index) {
    final productGroup = productGroups[index];
    return DataRow(
      selected: false,
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(productGroup.groupCode.toString())),
        DataCell(Text(productGroup.groupName.toString())),
        DataCell(Text(productGroup.description.toString())),
        DataCell(Text(productGroup.commission.toString())),
      ],
      onSelectChanged: (_) => print(
          'Row $index tapped: ${productGroups[index].id} - ${productGroups[index].groupName} - ${productGroups[index].description}'),
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
  int get rowCount => productGroups.length;

  @override
  int get selectedRowCount => 0;
}
