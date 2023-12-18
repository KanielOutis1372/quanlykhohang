// ignore_for_file: prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../controllers/discount_controller.dart';
import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class DiscountPage extends StatefulWidget {
  DiscountPage({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _startDate = RestorableDateTime(DateTime.now());
  final RestorableDateTime _endDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _startDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: (date) => _selectDate(date, isStartDate: true),
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _startDate.value.millisecondsSinceEpoch,
      );
    },
  );

  late final RestorableRouteFuture<DateTime?> _endDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: (date) => _selectDate(date, isStartDate: false),
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _endDate.value.millisecondsSinceEpoch,
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
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _startDatePickerRouteFuture, 'start_date_picker_route_future');
    registerForRestoration(
        _endDatePickerRouteFuture, 'end_date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate, {required bool isStartDate}) {
    if (newSelectedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate.value = newSelectedDate;
        } else {
          _endDate.value = newSelectedDate;
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${newSelectedDate.day}/${newSelectedDate.month}/${newSelectedDate.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Danh sách tất cả các mục trong dropdown
    DiscountController _discountCtrl = Get.put(DiscountController());
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
                  "Chiết khấu",
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
                    borderRadius: BorderRadius.circular(8),
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
                          "Nhập thông tin chiết khấu",
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
                        Form(
                          child: Column(
                            children: [
                              MultiSelectDropDown(
                                onOptionSelected:
                                    (List<ValueItem> selectedOptions) {},
                                options: const <ValueItem>[
                                  ValueItem(label: 'Option 1', value: 1),
                                  ValueItem(label: 'Option 2', value: 2),
                                  ValueItem(label: 'Option 3', value: 3),
                                  ValueItem(label: 'Option 4', value: 4),
                                  ValueItem(label: 'Option 5', value: 5),
                                  ValueItem(label: 'Option 6', value: 6),
                                ],
                                hint: "Chọn sản phẩm",
                                searchEnabled: true,
                                selectionType: SelectionType.single,
                                chipConfig:
                                    const ChipConfig(wrapType: WrapType.wrap),
                                dropdownHeight: 300,
                                optionTextStyle: const TextStyle(fontSize: 16),
                                selectedOptionIcon:
                                    const Icon(Icons.check_circle),
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "VD: 15%",
                                  label: Text(
                                    "Chiết khấu",
                                    style: TextStyle(
                                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                              .toDouble() +
                                          2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "VD: 15 (đơn vị: cái)",
                                  label: Text(
                                    "Tặng thêm",
                                    style: TextStyle(
                                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                              .toDouble() +
                                          2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "VD: 250 (đơn vị: cái)",
                                  label: Text(
                                    "Điều kiện",
                                    style: TextStyle(
                                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                              .toDouble() +
                                          2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 34,
                              ),
                              MyDatePicker(
                                restorableDatePickerRouteFuture:
                                    _startDatePickerRouteFuture,
                                selectedDate: _startDate,
                                labelName: "Ngày bắt đầu",
                                isStartDate: true,
                              ),
                              Divider(
                                color: Colors.grey[600],
                                height: 20,
                                thickness: 0.6,
                                indent: 0,
                                endIndent: 2,
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              MyDatePicker(
                                restorableDatePickerRouteFuture:
                                    _endDatePickerRouteFuture,
                                selectedDate: _endDate,
                                labelName: "Ngày kết thúc",
                                isStartDate: false,
                              ),
                              Divider(
                                color: Colors.grey[400],
                                height: 20,
                                thickness: 0.6,
                                indent: 0,
                                endIndent: 2,
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
                                    backgroundColor: MaterialStateProperty
                                        .all<Color>(MyConfig
                                            .PRIMARY_COLOR), // Màu nền khi không được nhấn
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(Colors
                                            .grey), // Màu nền khi được nhấn
                                    // Các thuộc tính khác của ButtonStyle
                                  ),
                                  child: Text(
                                    "Lưu chiết khấu",
                                    style: TextStyle(
                                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                          .toDouble(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
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
                          "Danh sách chiết khấu",
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
                        Form(
                            child: Column(
                          children: [
                            MyDatePicker(
                              restorableDatePickerRouteFuture:
                                  _startDatePickerRouteFuture,
                              selectedDate: _startDate,
                              labelName: "Ngày bắt đầu",
                              isStartDate: true,
                            ),
                            Divider(
                              color: Colors.grey[600],
                              height: 20,
                              thickness: 0.6,
                              indent: 0,
                              endIndent: 2,
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            MyDatePicker(
                              restorableDatePickerRouteFuture:
                                  _endDatePickerRouteFuture,
                              selectedDate: _endDate,
                              labelName: "Ngày kết thúc",
                              isStartDate: false,
                            ),
                            Divider(
                              color: Colors.grey[400],
                              height: 20,
                              thickness: 0.6,
                              indent: 0,
                              endIndent: 2,
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .red), // Màu nền khi không được nhấn
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey), // Màu nền khi được nhấn
                                  // Các thuộc tính khác của ButtonStyle
                                ),
                                child: Text(
                                  "Tìm chiết khấu",
                                  style: TextStyle(
                                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                        .toDouble(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                        const SizedBox(
                          height: 36,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_downward),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "XUẤT FILE",
                                  style: TextStyle(
                                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                        .toDouble(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
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
                          height: 24,
                        ),
                        Obx(
                          () {
                            if (_discountCtrl.discounts.isNotEmpty) {
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
                                  columns: const [
                                    DataColumn(label: Text('STT')),
                                    DataColumn(label: Text('Mã hàng')),
                                    DataColumn(label: Text('Tên mặt hàng')),
                                    DataColumn(label: Text('Chiết khấu')),
                                    DataColumn(label: Text('Tặng thêm')),
                                    DataColumn(label: Text('Điều kiện')),
                                    DataColumn(label: Text('Thời hạn')),
                                  ],
                                  sortColumnIndex: 0,
                                  sortAscending: true,
                                  source: UserDataTableSourceDiscount(
                                      _discountCtrl.discounts, context),
                                  showCheckboxColumn: false,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDatePicker extends StatelessWidget {
  MyDatePicker({
    super.key,
    required this.labelName,
    required RestorableRouteFuture<DateTime?> restorableDatePickerRouteFuture,
    required RestorableDateTime selectedDate,
    required this.isStartDate,
  })  : _restorableDatePickerRouteFuture = restorableDatePickerRouteFuture,
        _selectedDate = selectedDate;

  final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture;
  final RestorableDateTime _selectedDate;
  final bool isStartDate;
  String labelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              _restorableDatePickerRouteFuture.present();
            },
            child: Text(
              labelName,
              style: TextStyle(
                color: MyConfig.SECONDARY_COLOR,
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() - 1,
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
                  color: MyConfig.SECONDARY_COLOR,
                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserDataTableSourceDiscount extends DataTableSource {
  final RxList<dynamic> discounts;
  final BuildContext context;
  UserDataTableSourceDiscount(this.discounts, this.context);

  @override
  DataRow getRow(int index) {
    final discount = discounts[index];
    return DataRow(
      selected: false,
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
      ],
      onSelectChanged: (_) => print(
          'Row $index tapped: ${discounts[index].id} - ${discounts[index].name} - ${discounts[index].color}'),
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
  int get rowCount => discounts.length;

  @override
  int get selectedRowCount => 0;
}
