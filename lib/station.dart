import 'dart:ffi';

import 'package:floor/floor.dart';

@Entity(tableName: 'stations')
class Station {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final double? latitude, longitude;

  Station({this.id, required this.name, this.latitude, this.longitude});
}
