import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}
class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: new Center(
        child: new Text('Your Camera Appear here!'),
      ),
    );
  }
}