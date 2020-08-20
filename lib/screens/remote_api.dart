import 'dart:convert';

import 'package:apikullanimi/models/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteApi extends StatefulWidget {
  @override
  _RemoteApiState createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Remote Api Kullanimi"),),
      body: FutureBuilder(future: getData(),builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index) {
                return ListTile(
                  leading: Text(snapshot.data[index].id.toString()),
                  title: Text(snapshot.data[index].title),
                  subtitle: Text(snapshot.data[index].body),
                );
              }
          );
        }else {
          return Center(child: CircularProgressIndicator(),);
        }
      }),
    );
  }

  Future<List<Post>> getData() async{
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if(response.statusCode == 200) {
      return (json.decode(response.body) as List).map((e) => Post.fromJsonMap(e)).toList();
    }else {
      throw Exception("An error occured");
    }
  }
}
