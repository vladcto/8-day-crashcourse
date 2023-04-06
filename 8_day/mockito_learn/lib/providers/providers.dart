import 'package:mockito_learn/model/cat_fact.dart';
import 'package:mockito_learn/providers/cat_fact_notifier.dart';
import 'package:mockito_learn/services/cat_api.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

final catFactProvider = StateNotifierProvider<CatFactNotifier, List<CatFact>>(
    (ref) => CatFactNotifier(CatApi(http.Client())));
