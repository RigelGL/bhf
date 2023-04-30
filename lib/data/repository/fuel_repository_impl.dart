import 'package:bhf/data/api/api_utils.dart';
import 'package:bhf/domain/model/fuel.dart';
import 'package:bhf/domain/model/fuel_log.dart';
import 'package:bhf/domain/model/period.dart';
import 'package:bhf/domain/repository/fuel_repository.dart';

class FuelRepositoryImpl implements FuelRepository {
  @override
  Future<List<Fuel>> getFuelInCity(int cityId, Period period) async {
    return ApiUtils.badGeFS(cityId, period);
  }

  @override
  Future<List<FuelLog>> getFuelLog(int cityId, int fuelId, Period period) async {
    return ApiUtils.badGeL(cityId,  fuelId, period);
  }

}