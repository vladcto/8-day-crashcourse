import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://reqres.in/api/",
      responseType: ResponseType.json,
    ),
  );
  final JsonEncoder _encoder = const JsonEncoder.withIndent("\t");

  Future<String> getUser() async {
    var random = Random();
    Response userData = await _dio.get('users/${random.nextInt(9) + 1}');
    return _encoder.convert(userData.data);
  }

  Future<String> postUser() async {
    String dataPost = """{"name": "Vlad","job": "shaverma-men"}""";
    Response response = await _dio.post(
      'users}',
      data: dataPost,
    );
    return _encoder.convert(response.data);
  }

  Future<String> putUser() async {
    String dataPut = """{"name": "Vlad","job": "shaverma-men"}""";
    Response response = await _dio.post(
      'users/420}',
      data: dataPut,
    );
    return _encoder.convert(response.data);
  }

  Future<String> deleteUser() async {
    Response response = await _dio.delete('users/420');
    return "${response.statusCode.toString()} , ${response.statusMessage}";
  }
}
