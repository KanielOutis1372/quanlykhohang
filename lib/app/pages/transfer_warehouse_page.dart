// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:quanlykhohang/app/controllers/transfer_warehouse_controller.dart';

import '../data/models/my_config.dart';
import '../data/models/ware_house_model.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class TransferWareHousePage extends StatefulWidget {
  const TransferWareHousePage({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<TransferWareHousePage> createState() => _TransferWareHousePageState();
}

class _TransferWareHousePageState extends State<TransferWareHousePage>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2001),
          lastDate: DateTime(3000),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  String? fileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final MultiSelectController<Warehouse> _warehouseCtrl =
        MultiSelectController();
    TransferWareHouseController _ctrl = Get.put(TransferWareHouseController());
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
                  "Chuyển kho",
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
                          "Chuyển kho",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  _restorableDatePickerRouteFuture.present();
                                },
                                child: Text(
                                  "Ngày chuyển kho",
                                  style: TextStyle(
                                    color: MyConfig.SECONDARY_COLOR,
                                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                            .toDouble() -
                                        1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 18),
                              child: GestureDetector(
                                onTap: () {
                                  _restorableDatePickerRouteFuture.present();
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}",
                                    style: TextStyle(
                                      // fontWeight: MyConfig.bold,
                                      color: MyConfig.SECONDARY_COLOR,
                                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                              .toDouble() +
                                          3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey[900],
                          height: 20,
                          thickness: 0.6,
                          indent: 0,
                          endIndent: 2,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        MultiSelectDropDown(
                          hintStyle: TextStyle(
                            fontSize:
                                MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() - 3,
                            color: MyConfig.SECONDARY_COLOR,
                          ),
                          hint: "Kho nhập",
                          showClearIcon: true,
                          controller: _warehouseCtrl,
                          onOptionSelected: (options) {
                            debugPrint(options.toString());
                          },
                          options: _ctrl.wareHouses
                              .map((item) => ValueItem<Warehouse>(
                                  label: item.fullname.toString(), value: item))
                              .toList(),
                          maxItems: _ctrl.wareHouses.length,
                          selectionType: SelectionType.multi,
                          chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                          dropdownHeight: 300,
                          optionTextStyle: const TextStyle(fontSize: 16),
                          selectedOptionIcon: const Icon(Icons.check_circle),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        MultiSelectDropDown(
                          hintStyle: TextStyle(
                            fontSize:
                                MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() - 3,
                            color: MyConfig.SECONDARY_COLOR,
                          ),
                          hint: "Kho xuất",
                          showClearIcon: true,
                          controller: _warehouseCtrl,
                          onOptionSelected: (options) {
                            debugPrint(options.toString());
                          },
                          options: _ctrl.wareHouses
                              .map((item) => ValueItem<Warehouse>(
                                  label: item.fullname.toString(), value: item))
                              .toList(),
                          maxItems: _ctrl.wareHouses.length,
                          selectionType: SelectionType.multi,
                          chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                          dropdownHeight: 300,
                          optionTextStyle: const TextStyle(fontSize: 16),
                          selectedOptionIcon: const Icon(
                            Icons.check_circle,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: pickFile,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(MyConfig
                                        .PRIMARY_COLOR), // Màu nền khi không được nhấn
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey), // Màu nền khi được nhấn
                                // Các thuộc tính khác của ButtonStyle
                              ),
                              child: const Text(
                                "Chọn file",
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                fileName ?? "",
                                style: const TextStyle(fontSize: 16),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
