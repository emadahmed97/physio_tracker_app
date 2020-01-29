import 'package:flutter/material.dart';
import 'package:physio_tracker/exercise_widget.dart';
import '../placeholder_widget.dart';
import '../calibration_widget.dart';
import '../exercise_widget.dart';
import 'package:physio_tracker/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CalibrationWidget(),
    ExerciseWidget(),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.yellow),
    PlaceholderWidget(Colors.orange),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhysioTracker'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: signOut)
        ],
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
            icon: new Icon(Icons.accessibility, color: Colors.black),
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

  signOut() async {
    try {
      FirebaseAuth.instance.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}