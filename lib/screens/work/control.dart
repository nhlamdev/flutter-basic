import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/screens/work/index.dart';
import 'package:test/services/works.dart';
import 'package:test/utils/func.dart';

class WorkControlScreen extends StatefulWidget {
  const WorkControlScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorkControlScreenState();
  }
}

class _WorkControlScreenState extends State<WorkControlScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  final WorkService _workService = WorkService();

  String title = '';
  String summary = '';
  DateTime selectedDate = DateTime.now();
  String type = 'normal';
  bool isComplete = false;

  Map<String, String> types = {
    'normal': 'Bình thường',
    'prioritize': 'Ưu tiên',
    'important': 'quang trọng',
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1977),
      lastDate: DateTime(2200),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, selectedDate.hour, selectedDate.minute);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null &&
        (pickedTime.hour != selectedDate.hour ||
            pickedTime.minute != selectedDate.minute)) {
      setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month,
            selectedDate.day, pickedTime.hour, pickedTime.minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Thêm mới một công việc'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WorksScreen()),
                  );
                },
              ),
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.lightBlue,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Tiêu đề công việc',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Material(
                          elevation: 5.0,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.deepOrange,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                title = value;
                              });
                            },
                            decoration: const InputDecoration(
                                fillColor: Colors.white, filled: true),
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Nội dung công việc',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 5.0,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.deepOrange,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                summary = value;
                              });
                            },
                            maxLines: 8,
                            decoration: const InputDecoration(
                                fillColor: Colors.white, filled: true),
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Ngày dự kiến hoàn thành',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Expanded(
                                child: Material(
                                    elevation: 5.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                          '${formatNumber(selectedDate.day)}/${formatNumber(selectedDate.month)}/${formatNumber(selectedDate.year)}',
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black)),
                                    ))),
                            Container(
                              color: Colors.teal,
                              child: IconButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  icon: const Icon(Icons.calendar_month)),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Giờ dự kiến hoàn thành',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Expanded(
                              child: Material(
                                  elevation: 5.0,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        '${formatNumber(selectedDate.hour)} : ${formatNumber(selectedDate.minute)}',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black),
                                      ))),
                            ),
                            Container(
                              color: Colors.teal,
                              child: IconButton(
                                  onPressed: () {
                                    _selectTime(context);
                                  },
                                  icon: const Icon(Icons.alarm)),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Độ quan trọng của công việc',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton<String>(
                          hint: const Text('Chọn độ quan trọng'),
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: const SizedBox(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          value: type,
                          onChanged: (String? newValue) {
                            setState(() {
                              type = newValue!;
                            });
                          },
                          items: types.entries.map((option) {
                            return DropdownMenuItem<String>(
                              value: option.key,
                              child: Text(option.value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(children: [
                          Checkbox(
                            value: isComplete,
                            onChanged: (bool? value) {
                              setState(() {
                                isComplete = value!;
                              });
                            },
                          ),
                          const Text(
                            'Hoàn thành',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                      )
                    ]))),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () async {
                          await _workService.add(title, summary,
                              selectedDate.toString(), type, isComplete);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WorksScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orangeAccent),
                        child: const Text(
                          'Lưu',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
