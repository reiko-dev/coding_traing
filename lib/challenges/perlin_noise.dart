import 'package:flutter/material.dart';

class PerlinNoise extends StatelessWidget {
  const PerlinNoise({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Text('\$${(value * 100).toStringAsFixed(2)}');
  }
}
