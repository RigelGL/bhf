import 'package:bhf/domain/model/city.dart';
import 'package:bhf/domain/state/cities_state.dart';
import 'package:bhf/internal/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  late CitiesState _citiesState;

  @override
  void initState() {
    super.initState();
    _citiesState = AppModule.citiesState();
    _citiesState.getCities();
  }

  Widget _getCity(City city) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), offset: const Offset(0, 2), blurRadius: 4)],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/fuel', arguments: city);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(children: [
              Expanded(child: Text(city.name, style: const TextStyle(fontSize: 25, color: Colors.black87))),
              const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.black87, size: 30),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Города'), automaticallyImplyLeading: false),
        body: Observer(builder: (context) {
          return _citiesState.isLoading
              ? const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()))
              : RefreshIndicator(
                  onRefresh: () async {
                    _citiesState.getCities();
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    itemCount: _citiesState.cities.length,
                    separatorBuilder: (c, i) => const SizedBox(height: 10),
                    itemBuilder: (c, i) => _getCity(_citiesState.cities[i]),
                  ),
                );
        }),
      ),
    );
  }
}
