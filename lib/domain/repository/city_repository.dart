import 'package:bhf/domain/model/city.dart';

abstract class CityRepository {
  Future<List<City>> getAllCities();
}