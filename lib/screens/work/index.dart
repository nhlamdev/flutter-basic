import 'package:flutter/material.dart';
import 'package:test/models/work.model.dart';
import 'package:test/screens/home.dart';
import 'package:test/screens/work/control.dart';
import 'package:test/services/works.dart';
import 'package:test/widgets/works-view/index.dart';

class WorksScreen extends StatefulWidget {
  const WorksScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorksScreenState();
  }
}

class _WorksScreenState extends State<WorksScreen> {
  int _currentIndex = 0;
  List<Work> works = [];

  final WorkService _workService = WorkService();

  _load() async {
    var result = await _workService.get();
    setState(() {
      works = result;
    });
  }

  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      WorksList(works),
      const Center(child: Text('thống kê')),
    ];

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WorkControlScreen()),
                );
              },
              icon: const Icon(Icons.library_add))
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'works',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'history',
          ),
        ],
      ),
    ));
  }
}
