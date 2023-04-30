import 'package:bhf/domain/model/fuel.dart';
import 'package:bhf/domain/model/fuel_log.dart';
import 'package:bhf/domain/model/period.dart';

abstract class FuelRepository {
  Future<List<Fuel>> getFuelInCity(int cityId, Period period);

  Future<List<FuelLog>> getFuelLog(int cityId, int fuelId, Period period);
}