import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class VehicleGraphPage extends StatefulWidget {
  const VehicleGraphPage({Key? key}) : super(key: key);

  @override
  _VehicleGraphPageState createState() => _VehicleGraphPageState();
}

class _VehicleGraphPageState extends State<VehicleGraphPage> {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio-300)*0.5;
    double height = (MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio-appWindow.titleBarHeight)*0.5;
    return Container(
      color: Colors.red,
      child: Text('sex'),
     // width: width,
      height: height,
    );
  }
}
