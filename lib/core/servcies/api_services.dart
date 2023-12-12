import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://my-safe-space.alacrity.technology/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({required String endPoint , required Map<String,dynamic> data}) async {
    var response = await _dio.post('$_baseUrl$endPoint',data: data);
    return response.data;
  }
}