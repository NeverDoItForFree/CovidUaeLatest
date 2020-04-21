import 'package:flutter/material.dart';
import 'package:covid_uae_2/uaePanel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map uaeData;
  fetchUaeData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/are ');
    setState(() {
      uaeData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchUaeData();
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
            Text('Covid Tracker - UAE'),
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
                Text(
                  "May Allah Bless UAE & Its People",
                  style: TextStyle(fontSize: 10),
                ),
                Text("visit uae.gov  for official Info"),
                SpinKitPumpingHeart(
                  size: 10,
                  color: Colors.red,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text("Advertisement Area"),
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
      backgroundColor: Colors.white,
    );
  }
}
