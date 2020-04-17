import 'package:flutter/material.dart';
import 'package:covid_uae_2/uaePanel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map uaeData;
  fetchUaeData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/are ');
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
        title: Column(
          children: <Widget>[
            Text('Covid Tracker - UAE'),
           Text('created by ajmalaj.com',style: TextStyle(fontSize:10),)
          ],
        ),

      ),
        body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
              child:
              uaeData==null?CircularProgressIndicator():UaePanel(uaeData: uaeData)
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text("May Allah Bless UAE & Its People",style: TextStyle(fontSize: 10),),
                Text("visit uae.gov  for official Info"),
                Container(
                  margin: EdgeInsets.all(7),
                  height: 2,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,

                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text("Advertisement Area"),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text("Contact ajmalajuz@gmail.com or +971521321399",style: TextStyle(fontSize: 5),),
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

