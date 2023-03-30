import 'package:bloc_learn/page/main_page.dart';
import 'package:bloc_learn/provider/fruit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FruitProvider(),
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
