import 'dart:convert';

import 'package:apikullanimi/models/car.dart';
import 'package:flutter/material.dart';

class LocalApi extends StatefulWidget {
  @override
  _LocalApiState createState() => _LocalApiState();
}

class _LocalApiState extends State<LocalApi> {
  List<Car> allCars;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Api Kullanimi"),),
      body: FutureBuilder(future: getData(),builder: (context,snapshot) {
        if(snapshot.hasData) {
          allCars = snapshot.data;
          return ListView.builder(
              itemCount: allCars.length,
              itemBuilder: (context,index) {
                return ListTile(
                  title: Text(allCars[index].car_name),
                  subtitle: Text(allCars[index].country),
                );
              }
          );
        }else {
          return Center(child: CircularProgressIndicator(),);
        }
      }),
    );
  }

  Future<List> getData() async{

    var incomingJson = await DefaultAssetBundle.of(context).loadString("assets/car.json");
    List cars = (json.decode(incomingJson) as List).map((e) => Car.fromJsonMap(e)).toList();

    return cars;
  }

}

