import 'dart:math';

import 'package:bhf/domain/model/city.dart';
import 'package:bhf/domain/model/fuel.dart';
import 'package:bhf/domain/model/period.dart';
import 'package:bhf/domain/state/fuel_state.dart';
import 'package:bhf/internal/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class CityFuelPage extends StatefulWidget {
  const CityFuelPage({Key? key}) : super(key: key);

  @override
  State<CityFuelPage> createState() => _CityFuelPageState();
}

class _CityFuelPageState extends State<CityFuelPage> {
  var priceFormat = NumberFormat("###.00", "ru_RU");

  late FuelState _fuelState;
  late DateTime end;
  late DateTime start;

  City ?city;

  @override
  void initState() {
    super.initState();
    _fuelState = AppModule.fuelState();
    end = DateTime.now();
    start = end.subtract(const Duration(days: 184));
  }

  Widget _getFuel(Fuel fuel) {
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
            Navigator.of(context).pushNamed('/log', arguments: {'city': city!, 'fuel': fuel, 'period': Period(start, end)});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${fuel.type}, ${fuel.name}', style: const TextStyle(fontSize: 25, color: Colors.black87)),
                    SizedBox(height: 5),
                    Text('${priceFormat.format(fuel.currentPriceInPenny / 100)} ₽', style: const TextStyle(fontSize: 20, color: Colors.black45)),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.black87, size: 30),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    city = ModalRoute.of(context)?.settings.arguments as City;

    if(city == null)
      return Text('err');

    _fuelState.getFuelInCity(city!.id, Period(start, end));

    String startString = DateFormat('yyyy-MM-dd').format(start);
    String endString = DateFormat('yyyy-MM-dd').format(end);

    DateTime today = DateTime.now();
    DateTime yearsAgo = DateTime.now().subtract(const Duration(days: 3650));

    return Scaffold(
      appBar: AppBar(title: const Text('Топливо'), automaticallyImplyLeading: true),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black38, width: 1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(context: context, initialDate: start, firstDate: yearsAgo, lastDate: today);
                    if (picked != null) {
                      setState(() {
                        start = picked;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: 150,
                    child: Center(child: Text('C $startString', style: const TextStyle(fontSize: 20))),
                  ),
                ),
                const Icon(Icons.calendar_month_outlined, color: Colors.blueAccent, size: 40),
                InkWell(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(context: context, initialDate: end, firstDate: yearsAgo, lastDate: today);
                    if (picked != null) {
                      setState(() {
                        end = picked;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: 150,
                    child: Center(child: Text('По $endString', style: const TextStyle(fontSize: 20), textAlign: TextAlign.end)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Observer(builder: (context) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: _fuelState.fuels.length,
                separatorBuilder: (c, i) => const SizedBox(height: 10),
                itemBuilder: (c, i) => _getFuel(_fuelState.fuels[i]),
              );
            }),
          ),
        ],
      ),
    );
  }
}
