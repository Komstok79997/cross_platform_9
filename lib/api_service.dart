import 'package:dio/dio.dart';

class ApiService {
  // Налаштовуємо базові параметри запитів (BaseOptions)
  // Це дозволяє не дублювати субдомен у кожному запиті
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://komstok-lab13.requestcatcher.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // 1. Метод для авторизації
  static Future<void> login(String email, String password) async {
    try {
      await _dio.post('/login', data: {
        'action': 'Login',
        'email': email,
        'password': password,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Помилка під час відправки даних логіну: $e');
    }
  }

  // 2. Метод для реєстрації
  static Future<void> signUp(String name, String email, String password) async {
    try {
      await _dio.post('/signup', data: {
        'action': 'Sign Up',
        'name': name,
        'email': email,
        'password': password,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Помилка під час відправки даних реєстрації: $e');
    }
  }

  // 3. Метод для відновлення пароля
  static Future<void> resetPassword(String email) async {
    try {
      await _dio.post('/reset', data: {
        'action': 'Reset Password',
        'email': email,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Помилка під час запиту на скидання пароля: $e');
    }
  }
}