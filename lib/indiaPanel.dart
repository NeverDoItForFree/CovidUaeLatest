import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class IndiaPanel extends StatelessWidget {

  final Map indiaData;

  const IndiaPanel({Key key, this.indiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 210,

      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
          children: <Widget>[
            Panels(
                title: 'Confirmed',
                panelColor: Colors.red[100],
                textColor: Colors.red,
                count: indiaData["cases"].toString()
            ),
            Panels(
                title: 'Recovered',
                panelColor: Colors.green[100],
                textColor: Colors.green,
                count: indiaData["recovered"].toString()
            ),
            Panels(
                title: 'Deaths',
                panelColor: Colors.yellow[100],
                textColor: Colors.yellow,
                count: indiaData["deaths"].toString()
            ),
            Panels(
                title: 'New Cases',
                panelColor: Colors.blue[100],
                textColor: Colors.blue,
                count: indiaData["todayCases"].toString()
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
      height: 15,
      width: 15,

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

    );
  }
}















