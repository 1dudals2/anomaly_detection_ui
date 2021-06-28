import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class VehicleChartPage extends StatefulWidget {
  const VehicleChartPage({Key? key}) : super(key: key);

  @override
  _VehicleChartPageState createState() => _VehicleChartPageState();
}

class _VehicleChartPageState extends State<VehicleChartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio-300;
    double height = (MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio-appWindow.titleBarHeight)*0.5;
    return Container(
      width: width,
      height: height,
      //color: Colors.red,
      child: Row(
        children: [
          Container(
            width: width*0.5,
            height: height,
            color: Colors.amberAccent,
            child: Center(child: Text("Graph", style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
          ),
          SingleChildScrollView(
            child: Container(
              //color: Colors.blue,
              width: width*0.5,
              height: height,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: width*0.125,
                    color: Colors.blueAccent,
                    child: Text('이상 데이터 History'),
                  ),
                  Container(
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
                                  width: width*0.08,
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
                                  width: width*0.08,
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
                                  width: width*0.08,
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
                                  width: width*0.08,
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
                                  width: width*0.08,
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
                          height: height-120,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: width*0.08,
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
                                        width: width*0.08,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                    Container(
                                        width: width*0.08,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                    Container(
                                        width: width*0.08,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 2,color: Colors.grey),
                                              right:  BorderSide(width: 2,color: Colors.grey),
                                            )
                                        ),
                                        child: Text('adf')
                                    ),
                                    Container(
                                        width: width*0.08,
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
                  )
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
