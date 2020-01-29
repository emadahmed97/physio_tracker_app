import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'calibration_widget.dart';
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CalibrationWidget(),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.yellow),
    PlaceholderWidget(Colors.orange),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhysioTracker'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Colors.black),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail, color: Colors.black),
            title: new Text('Program'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, color: Colors.black),
            title: Text('Results')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.black),
              title: Text('Messages')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              title: Text('Options')
          )
        ],
      ),
    );

  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}