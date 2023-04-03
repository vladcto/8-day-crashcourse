import 'dart:convert';

import 'package:equatable/equatable.dart';

class CatFact extends Equatable {
  final String fact;

  const CatFact(this.fact);

  factory CatFact.fromJson(String json) => CatFact(jsonDecode(json)["fact"]);

  @override
  List<Object?> get props => [fact];

  @override
  bool? get stringify => false;
}
