import '../model/cat_fact.dart';

abstract class CatService {
  Future<CatFact> getCatFact();
}
