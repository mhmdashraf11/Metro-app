import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:metro2/full_details.dart';
import 'package:metro2/input_page.dart';
import 'package:metro2/station_database.dart';
import 'package:metro2/welcome_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();
  runApp(const MyApp());
}

Future<void> initDatabase() async {
  await copyDatabase();

  //open connection
  //connect to database
  final dir = await getApplicationDocumentsDirectory();
  final dbPath = join(dir.path, 'stations.db');

  database = await $FloorStationDatabase.databaseBuilder(dbPath).build();
}

late final StationDatabase database;

Future<void> copyDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  final path = join(dir.path, 'stations.db');
  print(dir);

  if (File(path).existsSync()) return;

  //copy from assets to this path
  ByteData data = await rootBundle.load('assets/databases/stations.db');
  List<int> bytes = data.buffer.asUint8List(
    data.offsetInBytes,
    data.lengthInBytes,
  );
  await File(path).writeAsBytes(bytes);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
