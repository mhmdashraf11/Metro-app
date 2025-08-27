import 'package:floor/floor.dart';
import 'package:metro2/station.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'station_dao.dart';
// import 'station.dart';
part 'station_database.g.dart';

@Database(version: 1, entities: [Station])
abstract class StationDatabase extends FloorDatabase {
  StationDao get stationDao;
}
