import 'package:flutter/material.dart';
import 'package:movies/AppDataBase.dart';

import 'myApp.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase dataBase = AppDatabase();
  await dataBase.createDB();
  runApp(MyApp2());
}
