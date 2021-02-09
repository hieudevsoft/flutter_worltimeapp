

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_now/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  WorldTime world_time = WorldTime(location: 'London',url:'Europe/London',flag: 'uk.png');
  String time = 'Loading...';
  void setUpTime() async{
    await world_time.getTime();
    setState(() {
      time = world_time.time;
      Navigator.pushReplacementNamed(context,'/home',arguments: {
        'location':world_time.location,
        'time':world_time.time,
        'flag':world_time.flag,
        'isDayTime':world_time.isDaytime
      });
    });
  }
  @override
  void initState() {
        super.initState();
        setUpTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(child: SpinKitFadingCircle(
        color: Colors.white,
        size: 80.0,
      )),
    );
  }
}
