import 'package:flutter/material.dart';

class CalibrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton.icon(
          color: Colors.red,
          icon: Icon(Icons.control_point), //`Icon` to display
          label: Text('Click to Start Calibration'), //`Text` to display
        ),
      ),
    );
  }
}