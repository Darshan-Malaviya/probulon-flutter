import 'package:flutter/material.dart';

class bottomBarScreen extends StatefulWidget {
  @override
  _bottomBarScreenState createState() => _bottomBarScreenState();
}

class _bottomBarScreenState extends State<bottomBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Container(color: Colors.blue, child: Center(child: Text('Page 1'))),
    Container(color: Colors.green, child: Center(child: Text('Page 2'))),
    Container(color: Colors.orange, child: Center(child: Text('Page 3'))),
    Container(color: Colors.purple, child: Center(child: Text('Page 4'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      drawer: Drawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // Disable animation
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: _currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: _currentIndex == 2 ? Colors.white : Colors.grey,
            ),
            label: 'Page 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_outline,
              color: _currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            activeIcon: Icon(
              Icons.lock,
              color: _currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            label: 'Page 4',
          ),
        ],
      ),
    );
  }
}
