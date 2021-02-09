

import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String url;
  String time;
  String flag;
  bool isDaytime;
  WorldTime({this.flag,this.location,this.url});
  Future<void> getTime() async{
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map map = jsonDecode(response.body);
      String offset = map['utc_offset'];
      offset = offset.substring(1,3);
      print(map['datetime']);
      DateTime now = DateTime.parse(map['datetime']);
      now = now.add(new Duration(hours: int.parse(offset)));
      print(now);
      isDaytime = (now.hour>=6 && now.hour<15) ? true:false;
      var f = DateFormat.jms();
      time = f.format(now);
    }catch(e){
      time = 'Could not receive time';
    }

  }
}