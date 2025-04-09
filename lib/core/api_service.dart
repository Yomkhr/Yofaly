import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yofaly/core/constants.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options); // continue with the request
        },
        onError: (e, handler) {
          // optional: handle errors globally
          print("Dio error: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }

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

  Future<Response> signup(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        '/users/register',
        data: {'username': fullName, 'email': email, 'password': password},
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

  Future<List<dynamic>> getRecipes() async {
    try {
      final response = await _dio.get('/recipes');
      return response.data;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<dynamic>> getRecipesByOrigin(String origin) async {
    try {
      final response = await _dio.get('/recipes/origin/${origin}');
      return response.data;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<dynamic>> getFavorite() async {
    try {
      final response = await _dio.get('/users/favorites');
      return response.data;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> addToFavorites(String id) async {
    try {
      await _dio.post('/users/favorites/$id');
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> removeFromFavorites(String id) async {
    try {
      await _dio.delete('/users/favorites/$id');
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<dynamic>> getFavorites() async {
    try {
      final response = await _dio.get('/users/favorites');
      return response.data;
    } on DioError catch (e) {
      throw _handleError(e);
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
