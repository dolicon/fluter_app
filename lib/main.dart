//import 'dart:html' hide VoidCallback;
import 'dart:developer';
import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

const broker='localhost';
const port=8889;
const ID_String='loser';

MqttServerClient client= MqttServerClient.withPort(broker, ID_String,port);

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GaugeModel(),
      child: MyApp2(),
    ),
  );
}




class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(),
      home: MyApps(),
    );
  }
}

String val2='';

class Page2 extends StatefulWidget {
  @override
  _MessageReceiverPageState createState() => _MessageReceiverPageState();}
class _MessageReceiverPageState extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Row(children: [nodes_list2(),Container(width: 300 ,height: 200,child:
       Consumer<GaugeModel>(
              builder: (context, gm1, child) { print(gm1._val2);return Temp_gauge(value: gm1._val2);},
            ))])
      ,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(height: 400,width: 400,
        padding: EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20.0,width: 200,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0,width: 200,),
            ElevatedButton(
              onPressed: () {
                // Add login logic here
                String email = _emailController.text;
                String password = _passwordController.text;
                // You can perform authentication here
                if(email=='0' && password == '0') Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePage()));
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Row(children: [Container(width: 200 ,height: 200,child: Text('place holder'))]),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
      ),
      body: Row(children: [Container(width: 200 ,height: 200,child: Text('place holder'))]),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 5'),
      ),
      body: Row(children: [Container(width: 200 ,height: 200,child: Text("place holder")
            )]
            ),
    );
  }
}

class nodes_list extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Column( mainAxisAlignment : MainAxisAlignment.spaceEvenly,children:
    <Widget>[Container(width: 100,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_1 On');},
      child: Text('Ketchin Light'),
    ),),
    Container(width: 100,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_2 On');},
      child: Text('bedroom Light'),
    ),),
    ElevatedButton(
      onPressed: (){pub('sw_3 On');Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page2()));},
      child: Text('bathroom Light'),
    ),
    Container(width: 100,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_4 On');},
      child: Text('livingroom Light'),
    ),),
    House_nav(),
    ],
    );;
}
}
class nodes_list2 extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Column( mainAxisAlignment : MainAxisAlignment.start,children:
    <Widget>[Container(width: 100,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_1 On');},
      child: Text('Light'),
    ),),
    Container(width: 100,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_2 On');},
      child: Text('AC'),
    ),),
    Container(width: 100,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_3 On');},
      child: Text('TV'),
    ),),
    Container(width: 100,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_4 On');},
      child: Text('what ever'),
    ),),
    ],
    );;
}
}
class nodes_list3 extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Column( mainAxisAlignment : MainAxisAlignment.spaceEvenly,children:
    <Widget>[Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_1 On');},
      child: Text('Light'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_2 On');},
      child: Text('AC'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_3 On');},
      child: Text('TV'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_4 On');},
      child: Text('what ever'),
    ),),
    ],
    );;
}
}
class nodes_list4 extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Column( mainAxisAlignment : MainAxisAlignment.spaceEvenly,children:
    <Widget>[Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_1 On');},
      child: Text('Light'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_2 On');},
      child: Text('AC'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_3 On');},
      child: Text('TV'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_4 On');},
      child: Text('what ever'),
    ),),
    ],
    );;
}
}
class nodes_list5 extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Column( mainAxisAlignment : MainAxisAlignment.spaceEvenly,children:
    <Widget>[Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_1 On');},
      child: Text('Light'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_2 On');},
      child: Text('AC'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_3 On');},
      child: Text('TV'),
    ),),
    Container(width: 200,height: 50,child: ElevatedButton(
      onPressed: (){pub('sw_4 On');},
      child: Text('what ever'),
    ),),
    ],
    );;
}
}









class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQTT Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  String _receivedValue = '';

  @override
  void initState() {
    super.initState();
    client.secure=true;
    final securityContext = SecurityContext.defaultContext;
    securityContext.setTrustedCertificates('D:\\certs\\ca.crt');
    _connectToMqttBroker();
  }

  void _connectToMqttBroker() async {
    print('mqtt init started');
    await client.connect();
    print('mqtt conected?');
    client.subscribe('topic/1', MqttQos.exactlyOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? messages) {
      final recMess = messages![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      String value = pt;

      setState(() {
        _receivedValue = value;
        if (value.indexOf("temp")>=0){
          _receivedValue=value.split("_@_")[1];
          log('fuck u');
          val2=_receivedValue;
          Provider.of<GaugeModel>(context, listen: false)
              .updateVal2(_receivedValue);
          
        }
      });
    });
  }

  void _disconnectFromMqttBroker() {
    client.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT Flutter App'),
      ),
      body: Row(mainAxisAlignment:MainAxisAlignment.start, children:<Widget>[Column(
          mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,
              children: <Widget>[ ExpansionTile(
              title: const Text('Lights.'),
              children: <Widget>[nodes_list(),
              ],
            ),]
              ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[SizedBox(width: 600,height: 60,child: TextFormField(
                  decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: 'Enter your  message'),controller: myController,
                  )
                  ,),
                  ElevatedButton(
                onPressed: () {
                  pub(myController.text);
                },
                child: Text('Publish Message'),
              ),LightBulb()])]
    ));
  }
}

void pub(String messaage){
  MqttClientPayloadBuilder x = MqttClientPayloadBuilder();
  x.addString(messaage);
if(client.connectionStatus!.state == MqttConnectionState.connected){
  client.publishMessage('topic/2', MqttQos.exactlyOnce, x.payload!);}
else {print('not connected asshole ');}
}





class LightBulb extends StatefulWidget {
  @override
  _LightBulbState createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> {
  bool isOn = false;
  String ID='';
  void toggleLight() {
    setState(() {
      isOn = !isOn;
    });
  }
void setID(String iD){
  ID=iD;
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: toggleLight,
        child: Center(
          child: Container(
            width: 150,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOn ? const Color.fromARGB(255, 228, 43, 30) : const Color.fromARGB(255, 59, 57, 57),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.lightbulb,
                size: 50,
                color: isOn ? Colors.yellow.shade900 : Colors.grey.shade800,
              ),
            ),
          ),
        ),
      );
  }
}

class InvisibleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const InvisibleButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(''),
      ),
    );
  }
}


class House_nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
  children: [
    Image.asset(
      'assets/houuse.JPG', // Update with the actual path to your image
      width: 400,
      height: 400,
    ),
    Positioned(
      top: 50,
      left: 50,
      child: InvisibleButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page2()));
        },
      ),
    ),
    Positioned(
      top: 50,
      right: 50,
      child: InvisibleButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page3()));
        },
      ),
    ),
    Positioned(
      bottom: 50,
      left: 50,
      child: InvisibleButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page4()));
        },
      ),
    ),
    Positioned(
      bottom: 50,
      right: 50,
      child: InvisibleButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page5()));
        },
      ),
    ),
  ],
);

}}


class Temp_gauge extends StatefulWidget{
  final String value;
  Temp_gauge({required this.value});
  GaugeState createState() => GaugeState();
}

class GaugeState extends State<Temp_gauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: double.parse(widget.value),
                      color: Colors.blue,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: double.parse(widget.value),
                      needleColor: Colors.red,
                    ),
                  ],
                ),
              ],
            );
  }
}


class GaugeModel extends ChangeNotifier {
  String _val2 = '';
  String get val2 => _val2;
  
  void updateVal2(String newValue) {
    _val2 = newValue;
    log("notified");
    notifyListeners(); // Notify listeners about the change
  }
}
