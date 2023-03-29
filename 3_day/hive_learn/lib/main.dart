import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_learn/model/worker.dart';
import 'package:hive_learn/page/worker_page.dart';
import 'package:hive_learn/repository/boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(WorkerAdapter());
  await Hive.openBox<Worker>(Boxes.workersBoxName);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkerPage(),
    );
  }
}
