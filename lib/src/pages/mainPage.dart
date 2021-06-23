import 'package:anomaly_detection_ui/commonly_used_widget/MapPaintingWidget.dart';
import 'package:anomaly_detection_ui/constants/WindowsButtonColor.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget{

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool mqttInitialized = false;
  Widget build(BuildContext context){
    MQTTModel mqttModel = context.watch<MQTTModel>();
    if(mqttInitialized ==false) {
      MQTTManager().InitMQTTManager(mqttModel, "01");
      mqttModel.addOht("01");
      mqttInitialized = true;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(child: MoveWindow()),
                    Row(
                      children: [
                        MinimizeWindowButton(
                          colors: buttonColors,
                        ),
                        MaximizeWindowButton(
                          colors: buttonColors,
                        ),
                        CloseWindowButton(
                          colors: closeButtonColors,
                        ),

                      ],
                    )
                  ],
                ),
              ),
              //MapPaintingWidget()
              mqttModel.ohtDatas["01"] != null ? Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mqttModel. ohtDatas["01"]?.length,
                    itemBuilder: (BuildContext context, int index){
                              return Container(
                                height: 30,
                                width: 30,
                                child: Text(mqttModel.ohtDatas["01"]!
                                    .elementAt(index)
                                    .accx_rms
                                    .toString()),
                              );

                          }
                ),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
