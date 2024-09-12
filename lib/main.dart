import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/excercise2/exercise2.dart';
import 'package:test1/getx/coin_binding.dart';
import 'package:test1/getx/getx_screen.dart';
import 'package:test1/stagger_grid/stagger_grid.dart';

import 'exercise/excerise_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CoinBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _button(String title, {VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  _onMaterialRout(Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => child));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _button("Exercise 1",
                onPressed: () => _onMaterialRout(const ExerciseOne())),
            const SizedBox(
              height: 10,
            ),
            _button("Exercise 2",
                onPressed: () => _onMaterialRout(const Exercise2())),
            const SizedBox(
              height: 10,
            ),
            _button(
              "GetX",
              onPressed: () => _onMaterialRout(const GetXScreen()),
            ),
            const SizedBox(
              height: 10,
            ),
            _button(
              "Stagger Grid",
              onPressed: () => _onMaterialRout(const StaggerGrid()),
            )
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      )),
    );
  }
}
