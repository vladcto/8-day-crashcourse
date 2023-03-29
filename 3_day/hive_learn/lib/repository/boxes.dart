import 'package:hive/hive.dart';
import 'package:hive_learn/model/worker.dart';

abstract class Boxes {
  static const workersBoxName = "workers";
  static var workersBox = Hive.box<Worker>(workersBoxName);
}
