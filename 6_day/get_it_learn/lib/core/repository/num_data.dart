import 'dart:math';

class NumData {
  final int value;
  NumData(int minN, int maxN)
      : assert(minN <= maxN),
        value = Random().nextInt(maxN - minN) + minN;
}
