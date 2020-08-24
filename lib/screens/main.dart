import 'package:apikullanimi/screens/local_api.dart';
import 'package:apikullanimi/screens/remote_api.dart';
import 'package:apikullanimi/screens/remote_api_two.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Home(),
        "/localApi" : (context) => LocalApi(),
        "/remoteApi" : (context) => RemoteApi(),
        "/remoteApi2" : (context) => RemoteApiTwo()
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Kullanimi"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Local Api"),
              onPressed: () => Navigator.pushNamed(context, "/localApi"),
            ),
            RaisedButton(
              child: Text("Remote Api"),
              onPressed: () => Navigator.pushNamed(context, "/remoteApi"),
            ),
            RaisedButton(
              child: Text("Remote Api 2"),
              onPressed: () => Navigator.pushNamed(context, "/remoteApi2"),
            )
          ],
        ),
      ),
    );
  }
}
