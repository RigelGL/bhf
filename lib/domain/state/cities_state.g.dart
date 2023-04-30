// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CitiesState on CitiesStateBase, Store {
  late final _$citiesAtom =
      Atom(name: 'CitiesStateBase.cities', context: context);

  @override
  List<City> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<City> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CitiesStateBase.isLoading', context: context);

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

  late final _$getCitiesAsyncAction =
      AsyncAction('CitiesStateBase.getCities', context: context);

  @override
  Future<void> getCities() {
    return _$getCitiesAsyncAction.run(() => super.getCities());
  }

  @override
  String toString() {
    return '''
cities: ${cities},
isLoading: ${isLoading}
    ''';
  }
}
