import 'package:anomaly_detection_ui/commonly_used_widget/trackPlotWidget.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
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
    double width = MediaQuery.of(context).size.width *0.5;
    double height = (MediaQuery.of(context).size.height-appWindow.titleBarHeight)*0.5;;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 50,
                width: 200,
                child: Center(child: Text('이상 데이터 History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              ),
              Container(
                width: 750,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2,color: Colors.grey),
                    )
                ),
               // height: height-50,
                //padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      //height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 70,
                            width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2,color: Colors.lightBlue),
                                    bottom: BorderSide(width: 2,color: Colors.lightBlue),
                                    left:  BorderSide(width: 2,color: Colors.lightBlue),
                                    right:  BorderSide(width: 2,color: Colors.lightBlue),
                                  )
                              ),
                            child: Text('Time',textAlign: TextAlign.center,)
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2,color: Colors.lightBlue),
                                    bottom: BorderSide(width: 2,color: Colors.lightBlue),
                                    right:  BorderSide(width: 2,color: Colors.lightBlue),
                                  )
                              ),

                                    child: Text('Vehicle',textAlign: TextAlign.center,)
                                ),
                                Container(
                                    height: 70,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(width: 2,color: Colors.lightBlue),
                                          bottom: BorderSide(width: 2,color: Colors.lightBlue),
                                          right:  BorderSide(width: 2,color: Colors.lightBlue),
                                        )
                                    ),
                                    child: Text('Segment',textAlign: TextAlign.center,)
                                ),
                                Container(
                                    height: 70,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(width: 2,color: Colors.lightBlue),
                                          bottom: BorderSide(width: 2,color: Colors.lightBlue),
                                          right:  BorderSide(width: 2,color: Colors.lightBlue),
                                        )
                                    ),
                                    child: Text('Loss',textAlign: TextAlign.center,)
                                ),
                                Container(
                                    height: 70,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(width: 2,color: Colors.lightBlue),
                                          bottom: BorderSide(width: 2,color: Colors.lightBlue),
                                          right:  BorderSide(width: 2,color: Colors.lightBlue),
                                        )
                                    ),
                                    child: Text('Event_Label',textAlign: TextAlign.center,)
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 300,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 13,
                                itemBuilder: (BuildContext context, int index){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 70,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(width: 2,color: Colors.grey),
                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                    Container(
                                        height: 70,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                    Container(
                                        height: 70,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                    Container(
                                        height: 70,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                    Container(
                                        height: 70,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            border: Border(

                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                  ],
                                );
                                }
                            ),
                          )

                        ],
                      ),
                    ),
                ],
              ),
          SizedBox(
            width: 100,
          ),
          TrackPlotWidget()
        ],
      ),
    );
  }
}
