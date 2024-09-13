import 'package:dio/dio.dart';

class ApiRepository {
  static final ApiRepository _instance = ApiRepository._internal();

  factory ApiRepository() {
    return _instance;
  }

  ApiRepository._internal() {
    configureDio();
  }

  final Dio dio = Dio();

  // static const String _iP = '172.17.12.83';
  static const String _baseUrl =
      'https://ror-django-backend-7pxm.onrender.com/api';
  static const String _doctorLogin = '/users/doctor/login';
  static const String _doctorRegister = '/users/doctor/register';
  static const String _checkNavigation = '/classify/v1/check-navigation/';
  static const String _texttoText = '/classify/v1/text-voice-generator/';

  void configureDio() {
    dio.options.baseUrl = _baseUrl;
  }

  Future<Map<String, dynamic>> doctorLogin(
      Map<String, dynamic> doctorData) async {
    try {
      final response = await dio.post(_doctorLogin, data: doctorData);
      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> doctorRegister(
      Map<String, dynamic> doctorData) async {
    try {
      final response = await dio.post(_doctorRegister, data: doctorData);
      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> checkNavigation(
      Map<String, dynamic> navigationData) async {
    try {
      final response = await dio.post(_checkNavigation, data: navigationData);
      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> textToText(String text) async {
    try {
      final response = await dio.post(_texttoText, data: {'text': text});
      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Map<String, dynamic> _handleDioError(DioException e) {
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
      return {
        'error': true,
        'message':
            'Error ${e.response?.statusCode}: ${e.response?.statusMessage}',
        'data': e.response?.data
      };
    } else {
      print('Error sending request!');
      print(e.message);
      return {
        'error': true,
        'message': e.message ?? 'An unknown error occurred',
      };
    }
  }
}
