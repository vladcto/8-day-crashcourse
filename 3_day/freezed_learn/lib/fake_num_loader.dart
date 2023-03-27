import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "fake_num_loader.freezed.dart";

@freezed
class FakeNumLoader with _$FakeNumLoader {
  const FakeNumLoader._();

  const factory FakeNumLoader.loading() = Loading;
  const factory FakeNumLoader.complete({required int num}) = Complete;
}

extension Preview on Complete {
  String preview() => "My num is ${this.num}.";
}

class FakeNumProvider extends ChangeNotifier {
  FakeNumLoader status = const FakeNumLoader.complete(num: 0);

  void increment() async {
    if (status is Loading) return;
    int num = (status as Complete).num;
    status = const FakeNumLoader.loading();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 4));
    status = FakeNumLoader.complete(num: num + 1);
    notifyListeners();
  }
}
