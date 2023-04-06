import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_learn/model/cat_fact.dart';
import 'package:mockito_learn/services/cat_api.dart';
import "cat_api_test.mocks.dart";

@GenerateMocks([http.Client])
void main() {
  setUp(() => null);
  tearDown(() => null);

  group("Api call", () {
    final MockClient client = MockClient();
    test(
      "Create cat fact from JSON",
      () async {
        const String testFact = "Its test fact";
        CatApi api = CatApi(client);

        when(
          client.get(
            Uri.https(CatApi.apiUrl, "/fact"),
          ),
        ).thenAnswer(
            (value) async => http.Response("{\"fact\": \"$testFact\"}", 200));

        expect(await api.getCatFact(), const CatFact(testFact));
      },
    );

    test(
      "Throw exception on API failure",
      () async {
        CatApi api = CatApi(client);

        when(
          client.get(
            Uri.https(CatApi.apiUrl, "/fact"),
          ),
        ).thenThrow(Exception());

        await expectLater(api.getCatFact(), throwsException);
        verify(client.get(Uri.https(CatApi.apiUrl, "/fact")));
      },
    );
  });
}
