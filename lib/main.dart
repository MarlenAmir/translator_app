import 'package:flutter/material.dart';
import 'ui/app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favorite_translations');
  runApp(MyApp());
}

