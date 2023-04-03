import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito_learn/providers/providers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ProviderScope(
          child: MainContent(),
        ),
      ),
    );
  }
}

class MainContent extends ConsumerWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var facts = ref.watch(catFactProvider);

    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 256,
                maxWidth: 256,
                minHeight: 256,
              ),
              child: Column(
                children: facts
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(e.fact),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => ref.read(catFactProvider.notifier).addCat(),
                child: const Text("Get new cat"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
