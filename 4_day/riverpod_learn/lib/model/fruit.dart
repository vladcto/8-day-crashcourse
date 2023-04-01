import 'package:flutter/material.dart' show Color;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fruit.freezed.dart';

// Generate JSON for this class

@freezed
class Fruit with _$Fruit {
  const factory Fruit({
    required String name,
    required Color color,
  }) = _Fruit;
}
