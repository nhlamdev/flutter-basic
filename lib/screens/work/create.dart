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
                child: const Center(
                  child: SizedBox(
                      width: 400,
                      height: 400,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Material(
                                elevation: 5.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.deepOrange,
                                child: SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 300,
                              child: Material(
                                elevation: 5.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.deepOrange,
                                child: SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 300,
                              child: Material(
                                elevation: 5.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.deepOrange,
                                child: SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  ),
                                ),
                              ),
                            )
                          ])),
                ))));
  }
}
