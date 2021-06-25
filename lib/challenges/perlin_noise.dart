import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fast_noise/fast_noise.dart';

class PerlinNoiseAnimation extends StatefulWidget {
  const PerlinNoiseAnimation({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  State<PerlinNoiseAnimation> createState() => _PerlinNoiseAnimationState();
}

class _PerlinNoiseAnimationState extends State<PerlinNoiseAnimation> {
  late PerlinNoise _noise;
  double xoff = 0;

  @override
  void initState() {
    super.initState();
    final rand = Random();
    //seed controlls the inicial value.
    _noise = PerlinNoise(
      frequency: 0.5,
      seed: rand.nextInt(1337),
      interp: Interp.Linear,
    );
  }

  double generateNoiseValue() {
    xoff += 0.01;

    double noiseValue = _noise.getPerlin2(xoff, 1);

    //Gera um número entre 0 e 1
    noiseValue = noiseValue * 0.5 + 0.5;

    return noiseValue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomPaint(
      painter: MyPainter(generateNoiseValue()),
      child: SizedBox.fromSize(
        size: size,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(this.noiseValue);

  final double noiseValue;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width * noiseValue, size.height / 2),
      10,
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    if (noiseValue != oldDelegate.noiseValue) return true;

    return false;
  }
}
