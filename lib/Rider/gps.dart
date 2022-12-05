import 'package:flutter/material.dart';

class gps extends StatefulWidget {
  const gps({Key? key}) : super(key: key);

  @override
  State<gps> createState() => _gpsState();
}

class _gpsState extends State<gps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: Text(
          'GPS',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
