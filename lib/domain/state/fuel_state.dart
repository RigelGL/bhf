import 'package:bhf/domain/model/fuel.dart';
import 'package:bhf/domain/model/period.dart';
import 'package:bhf/domain/repository/fuel_repository.dart';
import 'package:mobx/mobx.dart';

part 'fuel_state.g.dart';

class FuelState = FuelStateBase with _$FuelState;

abstract class FuelStateBase with Store {
  FuelStateBase(this._fuelRepository);

  final FuelRepository _fuelRepository;

  @observable
  List<Fuel> fuels = ObservableList();

  @observable
  bool isLoading = false;

  @action
  Future<void> getFuelInCity(int cityId, Period period) async {
    isLoading = true;
    fuels.clear();
    fuels.addAll(await _fuelRepository.getFuelInCity(cityId, period));
    isLoading = false;
  }
}
