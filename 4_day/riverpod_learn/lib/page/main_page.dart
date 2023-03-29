import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/fruit.dart';

StateProvider<Fruit> fruitProvider = StateProvider(
  (ref) => const Fruit(
    name: 'Apple',
    color: Colors.red,
  ),
);

var autoFruitProvider = FutureProvider.autoDispose(
  (ref) async {
    var fruit = ref.watch(fruitProvider);
    await Future.delayed(const Duration(seconds: 3));
    return fruit;
  },
);

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
            Consumer(
              builder: (context, ref, child) => Text(ref.watch(fruitProvider).name),
            ),
            const SizedBox(height: 8),
            const FutureFruitPreviewer(),
            const SizedBox(height: 8),
            Consumer(
              builder: (_, ref, __) => ElevatedButton(
                onPressed: () => ref.refresh(fruitProvider),
                child: const Text("Fruit reset"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => FloatingActionButton(
          onPressed: () {
            ref.read(fruitProvider.notifier).state = const Fruit(
              name: 'Banana',
              color: Colors.yellow,
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class FutureFruitPreviewer extends ConsumerWidget {
  const FutureFruitPreviewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fruit = ref.watch(autoFruitProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: fruit.when(
          data: (fruit) => Text(fruit.name),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text(error.toString()),
        ),
      ),
    );
  }
}
