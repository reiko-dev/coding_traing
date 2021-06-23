import 'package:coding_traing/challenges/perlin_noise.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Animate(),
    );
  }
}

class Animate extends StatefulWidget {
  const Animate({Key? key}) : super(key: key);

  @override
  _AnimateState createState() => _AnimateState();
}

class _AnimateState extends State<Animate> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text('Toggle'),
        onPressed: () {
          if (controller.isCompleted) {
            controller.repeat();
          } else {
            controller.forward();
          }
        },
      ),
      body: SizedBox.fromSize(
        size: size,
        child: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return PerlinNoise(value: controller.value);
            },
          ),
        ),
      ),
    );
  }
}
