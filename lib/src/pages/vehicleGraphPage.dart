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
    return Row(
      children: [
        Container(
          height: 500,
          width: 50,
          color: Colors.red,
        ),
        Container(
            height: 350,
            width: 250,
          color: Colors.blue,
          child: Center(child: Text("O\nH\nT",style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),)),
        ),
        Container(
            height: 500 ,
            width: 50,
          color: Colors.grey
        )
      ],
    );
  }
}
