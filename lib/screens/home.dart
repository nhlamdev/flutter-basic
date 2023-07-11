import 'package:flutter/material.dart';
import 'package:test/screens/work/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const Center(child: Text('cong viec hang ngay')),
      const Center(child: Text('thống kê')),
    ];

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('testste'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.payments),
                title: const Text('My works'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WorksScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: const Text('My finance'),
                onTap: () {
                  // Handle drawer item tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.summarize),
                title: const Text('My Note'),
                onTap: () {
                  // Handle drawer item tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Handle drawer item tap
                },
              ),
            ],
          ),
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
              icon: Icon(Icons.content_paste),
              label: 'dialy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'dashboard',
            ),
          ],
        ),
      ),
    );
  }
}
