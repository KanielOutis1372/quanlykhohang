// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../data/models/my_config.dart';
import '../widgets/manage_product.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class ImportProductPage extends StatefulWidget {
  ImportProductPage({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<ImportProductPage> createState() => _ImportProductPageState();
}

class _ImportProductPageState extends State<ImportProductPage>
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

  @override
  Widget build(BuildContext context) {
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
                  "Nhập hàng",
                  style: TextStyle(
                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                      color: MyConfig.SECONDARY_COLOR,
                      fontWeight: MyConfig.semiBold),
                ),
                SizedBox(
                  height: MyConfig.PADDING_PAGE.toDouble(),
                ),
                const ManageProduct(),
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
                          "Nhập thông tin Nhập hàng",
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
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
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
                                hint: "Chọn kho nhập",
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
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _restorableDatePickerRouteFuture.present();
                                },
                                child: Text(
                                  "Ngày tạo đơn",
                                  style: TextStyle(
                                    color: MyConfig.SECONDARY_COLOR,
                                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                            .toDouble() -
                                        1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 18),
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
                                        fontSize: MyConfig
                                                .PRIMARY_FONT_SIZE_TEXT
                                                .toDouble() +
                                            3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey[400],
                                height: 20,
                                thickness: 0.6,
                                indent: 0,
                                endIndent: 2,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              MultiSelectDropDown(
                                onOptionSelected:
                                    (List<ValueItem> selectedOptions) {},
                                options: const <ValueItem>[
                                  ValueItem(label: 'Chưa nhận hàng', value: 1),
                                  ValueItem(label: 'Đã nhận hàng', value: 2),
                                ],
                                hint: "Chọn trạng thái",
                                selectionType: SelectionType.single,
                                chipConfig:
                                    const ChipConfig(wrapType: WrapType.wrap),
                                dropdownHeight: 100,
                                optionTextStyle: const TextStyle(fontSize: 16),
                                selectedOptionIcon:
                                    const Icon(Icons.check_circle),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                minLines: 3,
                                maxLines: 100,
                                decoration: InputDecoration(
                                  label: const Text("Ghi chú đơn hàng"),
                                  hintText:
                                      "Ghi chú đơn hàng. VD: Đơn hàng ngoài",
                                  hintStyle: TextStyle(
                                      fontSize: MyConfig.SECOND_FONT_SIZE_TEXT
                                          .toDouble()),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
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
                                    "Thêm Đơn Hàng",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

