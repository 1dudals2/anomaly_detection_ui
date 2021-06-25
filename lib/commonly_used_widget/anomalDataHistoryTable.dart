import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnomalHistoryTable extends StatefulWidget {
  const AnomalHistoryTable({Key? key}) : super(key: key);

  @override
  _AnomalHistoryTableState createState() => _AnomalHistoryTableState();
}

class _AnomalHistoryTableState extends State<AnomalHistoryTable> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
    return Expanded(
      child: Container(
        color: Colors.black,
      ),
    );
  }
}
