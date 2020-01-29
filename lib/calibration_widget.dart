import 'package:flutter/material.dart';
import 'calibration_screen.dart';
class CalibrationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton.icon(
          color: Colors.red,
          icon: Icon(Icons.accessibility), //`Icon` to display
          label: Text('Start Calibration'), //`Text` to display
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalibrationScreen()),
            );
          },
        ),
      ),
    );
  }
}