import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    var color = data['isDayTime'] ? Colors.white : Colors.black;
    var colorText = data['isDayTime'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: color,
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
              )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.add_location_alt_outlined,
                    color: colorText,
                  ),
                  label: Text('Edit Location',
                      style: TextStyle(
                          color: colorText, letterSpacing: 1, fontSize: 20.0)),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 16),
                    child: Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 30.0, color: colorText, letterSpacing: 2.0),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 50.0, letterSpacing: 2.0, color: colorText),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
