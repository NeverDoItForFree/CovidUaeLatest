import 'package:flutter/material.dart';
import 'package:covid_uae_2/uaePanel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid_uae_2/indiaPanel.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map uaeData;
  Map indiaData;

  fetchUaeData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/are ');
    setState(() {
      uaeData = json.decode(response.body);
    });
  }

  fetchIndiaData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries/ind ');
    setState(() {
      indiaData = json.decode(response.body);
    });

  }

  @override
  void initState() {
    fetchUaeData();
    fetchIndiaData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 15,
        backgroundColor: Colors.black,
        title: Column(
          children: <Widget>[
            Text('Covid Tracker - UAE & IN'),
            Text(
              'created by ajmalaj.com',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
              child: uaeData == null
                  ? CircularProgressIndicator()
                  : UaePanel(uaeData: uaeData)),

          Container(
            child: Column(
              children: <Widget>[
                Text('India Data', style: TextStyle(fontSize: 15),),
                Container(
                    child: indiaData == null ? CircularProgressIndicator() : IndiaPanel(indiaData: indiaData,)
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    "Contact ajmalajuz@gmail.com or +971521321399",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}





