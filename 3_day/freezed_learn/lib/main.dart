import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_learn/fake_num_loader.dart';
import 'package:provider/provider.dart';

import 'game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Game game = Game(name: "DOKA 2 TRADE", publicationYear: 2019);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 460,
            child: ChangeNotifierProvider(
              create: (context) => FakeNumProvider(),
              builder: (providerContext, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(game.toString()),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(jsonEncode(game.toJson())),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Center(
                        child: Consumer<FakeNumProvider>(
                          builder: (_, provider, __) => provider.status.when(
                            loading: () => const SizedBox(
                              height: 128,
                              width: 128,
                              child: CircularProgressIndicator(),
                            ),
                            complete: (nums) => Text(nums.toString()),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Provider.of<FakeNumProvider>(providerContext, listen: false)
                            .increment(),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("Increment"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
