import 'package:flutter/material.dart';
import 'package:test/screens/home.dart';
import 'package:test/screens/work/create.dart';

class WorksScreen extends StatefulWidget {
  const WorksScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorksScreenState();
  }
}

class _WorksScreenState extends State<WorksScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const Center(child: Text('cong viec hang ngay')),
      const Center(child: Text('thống kê')),
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
          IconButton(
            icon: const Icon(Icons.add_to_photos),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WorkCreateScreen()),
              );
            },
          )
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
