import 'package:bhf/data/api/api_utils.dart';
import 'package:bhf/domain/model/city.dart';
import 'package:bhf/domain/repository/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  @override
  Future<List<City>> getAllCities() async {
    return ApiUtils.badGes();
  }
}
