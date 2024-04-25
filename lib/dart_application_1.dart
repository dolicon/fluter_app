import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
//import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
var broker='localhost';
var port='8083';

final client = MqttServerClient(broker, port);


final builder = MqttClientPayloadBuilder();



Future lll() async{
  
  client.logging(on: false);
  client.keepAlivePeriod = 5;
  client.port = 1883;
  client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;
  //client.websocketProtocols = ['mqtt'];
  client.onSubscribed = onSubscribed;
  client.pongCallback = pong;

  final connMess = MqttConnectMessage()

      .startClean() 
      .withWillQos(MqttQos.atLeastOnce);
  print('Client connecting....');
  client.connectionMessage = connMess;
//err handling
  try {
    await client.connect();
  } on NoConnectionException catch (e) {
    print('Client exception: $e');
    client.disconnect();
  } on SocketException catch (e) {
    print('Socket exception: $e');
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('Client connected');
  } else {
    print('Client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }
//
  const subTopic = 'topic/1';
  print('Subscribing to the $subTopic topic');
  client.subscribe(subTopic, MqttQos.atMostOnce);
  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print('Received message: topic is ${c[0].topic}, payload is $pt');
  });

  client.published!.listen((MqttPublishMessage message) {
    print('Published topic: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
  });

  const pubTopic = 'topic/1';
  builder.addString('Hello from mqtt_client');

  print('Subscribing to the $pubTopic topic');
  client.subscribe(pubTopic, MqttQos.exactlyOnce);

  print('Publishing our topic');
  client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);

  print('Sleeping....');
  await MqttUtilities.asyncSleep(20);

  print('Unsubscribing');
  client.unsubscribe(subTopic);
  client.unsubscribe(pubTopic);

  await MqttUtilities.asyncSleep(2);
  print('Disconnecting');
  client.disconnect();
}

/// The subscribed callback
void onSubscribed(String topic) {
  print('Subscription confirmed for topic $topic');
}

/// The unsolicited disconnect callback
void onDisconnected() {
  print('OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin ==
      MqttDisconnectionOrigin.solicited) {
    print('OnDisconnected callback is solicited, this is correct');
  }
  exit(-1);
}

/// The successful connect callback
void onConnected() {
  print('OnConnected client callback - Client connection was sucessful');
}

/// Pong callback
void pong() {
  print('Ping response client callback invoked');
}
void puba(){
  builder.addInt(6);
  client.publishMessage('topic/2', MqttQos.exactlyOnce, builder.payload!);
}
