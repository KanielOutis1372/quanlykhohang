import 'package:flutter/material.dart';

import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';
import '../widgets/sell_product_form.dart';

class ExportProductExcelPage extends StatefulWidget {
  const ExportProductExcelPage({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<ExportProductExcelPage> createState() => _ExportProductExcelPageState();
}

class _ExportProductExcelPageState extends State<ExportProductExcelPage>
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
                  "Xuất hàng",
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
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Xuất hàng bằng Excel",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: MyConfig.bold,
                              fontSize:
                                  MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() +
                                      4,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              const Text("File mẫu đơn xuất"),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red)),
                                child: Row(
                                  children: [
                                    const Icon(Icons.cloud_download),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Tải xuống",
                                      style: TextStyle(
                                        fontSize: MyConfig
                                            .PRIMARY_FONT_SIZE_TEXT
                                            .toDouble(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Divider(
                          color: Colors.grey[300],
                          height: 20,
                          thickness: 0.6,
                          indent: 0,
                          endIndent: 2,
                        ),
                        SellProductForm(
                            restorableDatePickerRouteFuture:
                                _restorableDatePickerRouteFuture,
                            selectedDate: _selectedDate, display: true,),
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
