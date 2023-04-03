import 'package:mockito_learn/model/cat_fact.dart';
import 'package:mockito_learn/services/cat_service.dart';
import 'package:http/http.dart' as http;

class CatApi implements CatService {
  static const String apiUrl = "catfact.ninja";

  final http.Client httpClient;

  CatApi(this.httpClient);

  @override
  Future<CatFact> getCatFact() async {
    var response = await httpClient.get(Uri.https(apiUrl, "/fact"));
    if (response.statusCode == 200) {
      return CatFact.fromJson(response.body);
    } else {
      throw Exception("Something went wrong");
    }
  }
}
