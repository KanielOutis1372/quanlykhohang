// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../data/models/my_config.dart';

class SellProductForm extends StatefulWidget {
  SellProductForm({
    super.key,
    required RestorableRouteFuture<DateTime?> restorableDatePickerRouteFuture,
    required RestorableDateTime selectedDate,
    required this.display,
  })  : _restorableDatePickerRouteFuture = restorableDatePickerRouteFuture,
        _selectedDate = selectedDate;

  final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture;
  final RestorableDateTime _selectedDate;
  var display;

  @override
  State<SellProductForm> createState() => _SellProductFormState();
}

class _SellProductFormState extends State<SellProductForm> {
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
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          MultiSelectDropDown(
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'Kho 1', value: 1),
              ValueItem(label: 'Kho 2', value: 2),
            ],
            hint: "Chọn kho bán",
            selectionType: SelectionType.single,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 100,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
          const SizedBox(
            height: 12,
          ),
          MultiSelectDropDown(
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'Chưa thanh toán', value: 1),
              ValueItem(label: 'Đã thanh toán', value: 2),
            ],
            hint: "Chọn trạng thái",
            selectionType: SelectionType.single,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 100,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
          const SizedBox(
            height: 12,
          ),
          MultiSelectDropDown(
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'Option 1', value: 1),
              ValueItem(label: 'Option 2', value: 2),
              ValueItem(label: 'Option 3', value: 3),
              ValueItem(label: 'Option 4', value: 4),
              ValueItem(label: 'Option 5', value: 5),
              ValueItem(label: 'Option 6', value: 6),
            ],
            hint: "Chọn nhân viên",
            searchEnabled: true,
            selectionType: SelectionType.single,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
          const SizedBox(
            height: 12,
          ),
          MultiSelectDropDown(
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'Option 1', value: 1),
              ValueItem(label: 'Option 2', value: 2),
              ValueItem(label: 'Option 3', value: 3),
              ValueItem(label: 'Option 4', value: 4),
              ValueItem(label: 'Option 5', value: 5),
              ValueItem(label: 'Option 6', value: 6),
            ],
            hint: "Chọn khách hàng",
            searchEnabled: true,
            selectionType: SelectionType.single,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
          const SizedBox(
            height: 30,
          ),
          
          GestureDetector(
            onTap: () {
              widget._restorableDatePickerRouteFuture.present();
            },
            child: Text(
              "Ngày tạo đơn",
              style: TextStyle(
                color: MyConfig.SECONDARY_COLOR,
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() - 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 18),
            child: GestureDetector(
              onTap: () {
                widget._restorableDatePickerRouteFuture.present();
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "${widget._selectedDate.value.day}/${widget._selectedDate.value.month}/${widget._selectedDate.value.year}",
                  style: TextStyle(
                    // fontWeight: MyConfig.bold,
                    color: MyConfig.SECONDARY_COLOR,
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
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
          TextFormField(
            decoration: InputDecoration(
              label: const Text("Thêm chiết khấu"),
              hintText: "0 %",
              hintStyle: TextStyle(
                  fontSize: MyConfig.SECOND_FONT_SIZE_TEXT.toDouble()),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            minLines: 3,
            maxLines: 100,
            decoration: InputDecoration(
              label: const Text("Ghi chú đơn hàng"),
              hintText: "Ghi chú đơn hàng. VD: Đơn hàng ngoài",
              hintStyle: TextStyle(
                  fontSize: MyConfig.SECOND_FONT_SIZE_TEXT.toDouble()),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: widget.display,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: pickFile,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        MyConfig.PRIMARY_COLOR), // Màu nền khi không được nhấn
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
                backgroundColor: MaterialStateProperty.all<Color>(
                    MyConfig.PRIMARY_COLOR), // Màu nền khi không được nhấn
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey), // Màu nền khi được nhấn
                // Các thuộc tính khác của ButtonStyle
              ),
              child: Text(
                "Thêm Đơn Hàng",
                style: TextStyle(
                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
