import 'package:dio/dio.dart';
import 'package:yofaly/core/constants.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<List<dynamic>> getProduits() async {
    try {
      final response = await _dio.get(ApiConstants.produitsEndpoint);
      return response.data as List;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/users/login',
        data: {'email': email, 'password': password},
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        rethrow;
      }
    }
  }

  String _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return 'Connection timeout';
      case DioErrorType.sendTimeout:
        return 'Send timeout';
      case DioErrorType.receiveTimeout:
        return 'Receive timeout';
      default:
        return 'Erreur inconnue: ${error.message}';
    }
  }
}
