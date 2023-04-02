import 'package:flutter/material.dart';
import 'package:get_it_learn/core/locator.dart';
import 'package:get_it_learn/core/repository/num_data.dart';
import 'package:get_it_learn/core/repository/num_service.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    NumService service = locator.get<NumService>();
    NumData numData = locator.get<NumData>(param1: -10, param2: 10);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card(
            child: SizedBox(
              width: 128,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(service.getNum().toString()),
                  const SizedBox(height: 16),
                  Text(numData.value.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
