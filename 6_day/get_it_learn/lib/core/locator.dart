import 'package:get_it/get_it.dart';
import 'package:get_it_learn/core/repository/num_data.dart';
import 'package:get_it_learn/core/repository/num_service.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<NumService>(NumService());
  locator.registerFactoryParam<NumData, int, int>((x, y) => NumData(x, y));
}
