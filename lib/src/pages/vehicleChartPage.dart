import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleChartPage extends StatefulWidget {
  const VehicleChartPage({Key? key}) : super(key: key);

  @override
  _VehicleChartPageState createState() => _VehicleChartPageState();
}

class _VehicleChartPageState extends State<VehicleChartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -300;
    double height = (MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio-appWindow.titleBarHeight)*0.5;
    return Container(
      width: width,
      height: height,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width*0.5,
            height: height,
            color: Colors.amberAccent,
            child: Center(child: Text("Graph", style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
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
    );
  }
}
