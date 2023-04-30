import 'package:bhf/data/repository/city_repository_impl.dart';
import 'package:bhf/data/repository/fuel_repository_impl.dart';
import 'package:bhf/domain/repository/city_repository.dart';
import 'package:bhf/domain/repository/fuel_repository.dart';
import 'package:bhf/domain/state/cities_state.dart';
import 'package:bhf/domain/state/fuel_state.dart';

class AppModule {
  static CityRepository? _cityRepository;
  static FuelRepository? _fuelRepository;

  static CitiesState? _cityState;
  static FuelState? _fuelState;

  static CityRepository cityRepository() {
    _cityRepository ??= CityRepositoryImpl();
    return _cityRepository!;
  }

  static FuelRepository fuelRepository() {
    _fuelRepository ??= FuelRepositoryImpl();
    return _fuelRepository!;
  }

  static CitiesState citiesState() {
    _cityState ??= CitiesState(cityRepository());
    return _cityState!;
  }

  static FuelState fuelState() {
    _fuelState ??= FuelState(fuelRepository());
    return _fuelState!;
  }
}
