import 'package:flutter/material.dart';
import './home_page.dart';
import './write_page.dart';
import './my_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageWidget(),
      theme: ThemeData(
        splashColor: Colors.transparent, // 버튼 누를 때 ripple 효과 제거
        highlightColor: Colors.transparent, // 버튼 누를 때 ripple 효과 제거
      ),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 27.0,
        backgroundColor: Colors.grey[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_square),
            label: 'Write',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_6_outlined),
            label: 'my_page',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
