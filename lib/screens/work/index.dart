import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/screens/home.dart';
import 'package:test/screens/work/create.dart';
import 'package:test/services/works.dart';

class WorksScreen extends StatefulWidget {
  const WorksScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorksScreenState();
  }
}

class _WorksScreenState extends State<WorksScreen> {
  int _currentIndex = 0;

  final WorkService _workService = WorkService();

  load() async {
    var result = await _workService.get();

    print(result[0].id);
  }

  @override
  void initState() {
    super.initState();

    load();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const Center(child: Text('cong viec hang ngay')),
      const Center(child: Text('thống kê')),
      const Center(child: Text('thống kê')),
    ];

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WorkCreateScreen()),
            );
          },
        ),
      ),
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
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Option 1'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Option 2'),
              ),
            ],
            onSelected: (int value) {
              // Handle selected option
            },
            offset: const Offset(0, 50), // Adjust the offset as needed
          ),
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
            icon: Icon(Icons.report),
            label: 'important',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'normal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            label: 'periodic',
          ),
        ],
      ),
    ));
  }
}
