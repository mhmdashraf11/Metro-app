import 'package:floor/floor.dart';
import 'package:metro2/station.dart';
import 'package:metro2/station_class.dart';

@dao
abstract class StationDao {
  @Query('select * from stations')
  Future<List<Station>> selectStations();
}
