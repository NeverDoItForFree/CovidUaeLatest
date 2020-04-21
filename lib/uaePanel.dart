import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:wave_progress_widget/wave_progress.dart';



class UaePanel extends StatelessWidget {

  final Map uaeData;

  const UaePanel({Key key, this.uaeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        children: <Widget>[
          Panels(
            title: 'Confirmed',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: uaeData["cases"].toString()
          ),
          Panels(
            title: 'Recovered',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: uaeData["recovered"].toString()
          ),
          Panels(
            title: 'Deaths',
            panelColor: Colors.yellow[100],
            textColor: Colors.yellow,
            count: uaeData["deaths"].toString()
          ),
          Panels(
            title: 'New Cases',
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            count: uaeData["todayCases"].toString()
          ),

        ],
      ),
    );
  }
}


class Panels extends StatelessWidget {


  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const Panels({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: WaveClipperOne(reverse: true),
        child: Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: panelColor,
          ), child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Text(count),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SpinKitThreeBounce(
                    color : Colors.white,
                    size:5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}








