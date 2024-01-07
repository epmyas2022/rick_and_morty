import 'package:dio/dio.dart';

class ApiData {
  static final _dio = Dio();

  static const String baseUrl = 'https://rickandmortyapi.com';
  getFetchCharacters({String? key, required int page}) async {
    final response = await _dio.get('$baseUrl/api/character/?page=$page');

    return response.data[key] ?? response.data;
  }

  getFetchCharactersParams({required Map<String, dynamic> params}) async {
    final response =
        await _dio.get('$baseUrl/api/character/', queryParameters: params);

    return response.data;
  }

  getFetchByIds(String ids) async {
    final response = await _dio.get('$baseUrl/api/character/$ids');

    return response.data;
  }
}
