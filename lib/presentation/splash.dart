import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Image.asset('assets/logo.png', width: 250),
          const SizedBox(height: 20),
          const Text('Солнечный круг, небо вокруг!', style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          const Text('BestHack 2023', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
        ],
      ),),
    );
  }
}
