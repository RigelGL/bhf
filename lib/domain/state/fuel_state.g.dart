// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FuelState on FuelStateBase, Store {
  late final _$fuelsAtom = Atom(name: 'FuelStateBase.fuels', context: context);

  @override
  List<Fuel> get fuels {
    _$fuelsAtom.reportRead();
    return super.fuels;
  }

  @override
  set fuels(List<Fuel> value) {
    _$fuelsAtom.reportWrite(value, super.fuels, () {
      super.fuels = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'FuelStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getFuelInCityAsyncAction =
      AsyncAction('FuelStateBase.getFuelInCity', context: context);

  @override
  Future<void> getFuelInCity(int cityId, Period period) {
    return _$getFuelInCityAsyncAction
        .run(() => super.getFuelInCity(cityId, period));
  }

  @override
  String toString() {
    return '''
fuels: ${fuels},
isLoading: ${isLoading}
    ''';
  }
}
