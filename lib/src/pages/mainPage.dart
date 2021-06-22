import 'package:anomaly_detection_ui/constants/WindowsButtonColor.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget{
  Widget build(BuildContext context){
    MQTTModel mqttModel = context.watch<MQTTModel>();
    MQTTManager().InitMQTTManager(mqttModel);
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
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mqttModel.datas.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 30,
                        width: 30,
                        child: Text(
                          mqttModel.datas.elementAt(index).accx_rms.toString()
                        ),
                      );
                }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}