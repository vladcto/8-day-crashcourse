import 'package:mockito_learn/model/cat_fact.dart';
import 'package:mockito_learn/services/cat_api.dart';
import 'package:riverpod/riverpod.dart';

class CatFactNotifier extends StateNotifier<List<CatFact>> {
  final CatApi catApi;
  CatFactNotifier(this.catApi) : super([]);

  void addCat() async {
    var cat = await catApi.getCatFact();
    state = (state
          ..insert(
            0,
            cat,
          ))
        .take(3)
        .toList();
  }
}
