import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/screens/work/index.dart';

class WorkCreateScreen extends StatefulWidget {
  const WorkCreateScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorkCreateScreenState();
  }
}

class _WorkCreateScreenState extends State<WorkCreateScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('render');
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Create new work'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WorksScreen()),
            );
          },
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.lightBlue,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
            const SizedBox(height: 10),
            Container(
              child: const Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.deepOrange,
                child: TextField(
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Nội dung công việc',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              child: const Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.deepOrange,
                child: TextField(
                  maxLines: 8,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Nội dung công việc',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.deepOrange,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.time_to_leave))
                ],
              ),
            )
          ])),
    ));
  }
}
