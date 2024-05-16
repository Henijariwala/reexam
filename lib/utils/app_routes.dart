import 'package:flutter/cupertino.dart';
import 'package:marking_flutter/screen/add_data/Add_screen.dart';
import 'package:marking_flutter/screen/home/home_screen.dart';

Map<String,WidgetBuilder>app_routes={
  '/':(context)=> const HomeScreen(),
  'add':(context)=> const AddStudScreen(),
};