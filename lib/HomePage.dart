import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var data; 
String url="http://userapi.tk/";

Future<String> getjsondata() async {
  var response=await http.get(Uri.encodeFull(url));

  setState(() {
    var converdata=json.decode(response.body);
    data=converdata;
    print(converdata);
    print(data[0]["Name"]);
  });
}
@override
  void initState() {
    getjsondata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Example"),
      ),
      body: ListView.builder(
  itemCount: data.length,
  itemBuilder: (context, index) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        leading:CircleAvatar(
          backgroundImage: NetworkImage(data[index]["ImageURL"]),
        ),
        title: Text(data[index]["Name"]),
        trailing: Text(data[index]["ID"]),
      ),
    );
  },
));
    
  }
}