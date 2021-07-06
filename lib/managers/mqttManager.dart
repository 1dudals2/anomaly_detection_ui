import 'dart:convert';
import 'dart:io';
import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';

final client = MqttServerClient('localhost', '');
class MQTTManager {
  Future<void> InitMQTTManager(MQTTModel model,DataCollectManager dataManager) async {
    client.logging(on: false);
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;


    final connMess = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .withWillTopic(
        'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      print('EXAMPLE::socket exception - $e');
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('EXAMPLE::Mosquitto client connected');
    } else {
      print(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client
              .connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    var topic = 'oms/vehicle/anomalyDetection';
    client.subscribe(topic, MqttQos.atMostOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message!);
      OhtDataModel mqtt = OhtDataModel.fromJson(jsonDecode(pt));
      if(!model.ohtDatas.keys.contains(mqtt.vehicle_id)) model.addOht(mqtt.vehicle_id);
      model.addToDatas(mqtt.vehicle_id ,mqtt);
      dataManager.startStoreData(mqtt, 2000);
      model.isinitiatedChange();
    });

  }

  /// The subscribed callback
  void onSubscribed(String topic) {

  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    //print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      //print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
    exit(-1);
  }

  /// The successful connect callback
  void onConnected() {
    //print(
       // 'EXAMPLE::OnConnected client callback - Client connection was sucessful');
  }

  /// Pong callback
  void pong() {
    //print('EXAMPLE::Ping response client callback invoked');
  }
}