import 'package:bhf/domain/repository/fuel_repository.dart';
import 'package:bhf/internal/app_module.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class GrPage extends StatefulWidget {
  const GrPage({Key? key}) : super(key: key);

  @override
  State<GrPage> createState() => _GrPageState();
}

class _GrPageState extends State<GrPage> {

  late FuelRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository  =AppModule.fuelRepository();
  }
  List<Feature> features = [
    Feature(
      title: 'll',
      color: Colors.blue,
      data: [0,],
    )
  ];


  bool load = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    final oo = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;


    List<String> s = List.empty(growable: true);

    // bad code
    if(!load) {
      load = true;
      final res = _repository.getFuelLog(oo['city'].id, oo['fuel'].id, oo['period']).then((value) {
         final d = value.map((e) => e.priceInPenny / 100 / 100).toList();
         print(features[0].data);

         setState(() {
           features[0].title = '${oo['fuel'].type} ${oo['fuel'].name}, ${oo['city'].name}';
           features[0].data = d;
         });
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('${oo['fuel'].type} ${oo['fuel'].name}, ${oo['city'].name}')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text("Цена", style: TextStyle(fontSize: 20)),
          ),
          LineGraph(
            features: features,
            size: Size(w, 400),
            labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
            labelY: ['20', '40', '60', '80', '100'],
            showDescription: true,
            graphColor: Colors.black45,
            graphOpacity: 0.2,
            verticalFeatureDirection: true,
            descriptionHeight: 130,
          ),
        ],
      ),
    );
  }
}
