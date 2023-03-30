import 'package:bloc_learn/provider/fruit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/fruit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Main Page')),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Fruit name'),
            const SizedBox(height: 8),
            BlocBuilder<FruitProvider, FruitState>(
              builder: (_, state) => Text(
                state.when(loading: () => "loading", loaded: (e) => e.name),
              ),
            ),
            const SizedBox(height: 8),
            const FutureFruitPreviewer(),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () =>
                  context.read<FruitProvider>().add(const FruitEvent.reset()),
              child: const Text("Fruit reset"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FruitProvider>().add(const FruitEvent.setBanan());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FutureFruitPreviewer extends BlocBuilderBase<FruitProvider, FruitState> {
  const FutureFruitPreviewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, FruitState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: state.when(
          loading: () => const CircularProgressIndicator(),
          loaded: (e) => Text(e.name),
        ),
      ),
    );
  }
}
