import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_now/pages/choose_location.dart';
import 'package:world_time_now/pages/home.dart';
import 'package:world_time_now/pages/loading.dart';

void main()=>runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>ChooseLocation()
    },
  )
);