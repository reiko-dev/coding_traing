import 'dart:math';

import 'package:fast_noise/fast_noise.dart';

main() {
  final rand = Random();

  PerlinNoise perlinNoise;

  perlinNoise = PerlinNoise(
    interp: Interp.Linear,
    seed: rand.nextInt(1337),
    frequency: 0.01,
  );

  for (var i = 0; i < 10000; i++) {
    final val = perlinNoise.getPerlin2(i * 1, 10);
    print(val * 50 + 50);
  }
}
