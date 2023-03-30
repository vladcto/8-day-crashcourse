import 'package:bloc/bloc.dart';
import 'package:bloc_learn/model/fruit.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "fruit_provider.freezed.dart";

class FruitProvider extends Bloc<FruitEvent, FruitState> {
  FruitProvider()
      : super(const FruitState.loaded(Fruit(name: 'Apple', color: Colors.red))) {
    on<FruitEvent>(
      (event, emit) async {
        if (state.maybeWhen(orElse: () => false, loading: () => true)) return;

        await event.when(
          reset: () async {
            emit(const FruitState.loading());
            await Future.delayed(const Duration(seconds: 2));
            emit(const FruitState.loaded(Fruit(name: 'Apple', color: Colors.red)));
          },
          setBanan: () async {
            emit(const FruitState.loading());
            await Future.delayed(const Duration(seconds: 2));
            emit(
                const FruitState.loaded(Fruit(name: 'Banan', color: Colors.yellow)));
          },
        );
      },
    );
  }
}

@freezed
class FruitEvent with _$FruitEvent {
  const FruitEvent._();

  const factory FruitEvent.reset() = _Reset;
  const factory FruitEvent.setBanan() = _SetBanan;
}

@freezed
class FruitState with _$FruitState {
  const FruitState._();

  const factory FruitState.loading() = _Loading;
  const factory FruitState.loaded(Fruit fruit) = _Loaded;
}
