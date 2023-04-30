import 'package:bhf/domain/model/city.dart';
import 'package:bhf/domain/model/fuel.dart';
import 'package:bhf/domain/model/fuel_log.dart';
import 'package:bhf/domain/model/period.dart';
import 'package:dio/dio.dart';

class ApiUtils {
  static const _BASE_URL = 'https://bhf.rigellab.ru/';

  static final Dio _dio = Dio(BaseOptions(baseUrl: _BASE_URL));

  static Future<List<City>> badGes() async {
    final re = (await _dio.get('/cities')).data;
    return List.generate(re.length, (i) => City(re[i]['name'], re[i]['id']));
  }

  static Future<List<Fuel>> badGeFS(int city, Period period) async {
    final re = (await _dio.get('/fuel', queryParameters: {'city': city, 'start': period.start.toIso8601String(), 'end': period.end.toIso8601String()})).data;
    print(re);
    return List.generate(re.length, (i) => Fuel(re[i]['name'], re[i]['type'], re[i]['id'], re[i]['price']));
  }

  static Future<List<FuelLog>> badGeL(int city, int fuel, Period period) async {
    final re = (await _dio.get('/log', queryParameters: {'city': city, 'fuel': fuel, 'start': period.start.toIso8601String(), 'end': period.end.toIso8601String()})).data;
    print(re);
    return List.generate(re.length, (i) => FuelLog(DateTime.parse(re[i]['date']), re[i]['price']));
  }
}
