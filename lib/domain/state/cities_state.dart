import 'package:bhf/domain/model/city.dart';
import 'package:bhf/domain/repository/city_repository.dart';
import 'package:mobx/mobx.dart';


part 'cities_state.g.dart';

class CitiesState = CitiesStateBase with _$CitiesState;

abstract class CitiesStateBase with Store {
  CitiesStateBase(this._cityRepository);

  final CityRepository _cityRepository;

  @observable
  List<City> cities = ObservableList();

  @observable
  bool isLoading = false;

  @action
  Future<void> getCities() async {
    isLoading = true;
    cities.clear();
    cities.addAll(await _cityRepository.getAllCities());
    isLoading = false;
  }
}