import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://mock-api.calleyacd.com/api/auth";

  static Future<dynamic> register({
    required String username,
    required String email,
    required String password,
  }) async {
    return await http.post(
      Uri.parse("https://mock-api.calleyacd.com/api/auth/register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
      }),
    );


  }

  static Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    return await http.post(
      Uri.parse("https://mock-api.calleyacd.com/api/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );


  }

  static Future<dynamic> sendOtp({
    required String email,
  }) async {
    return await http.post(
      Uri.parse("https://mock-api.calleyacd.com/api/auth/send-otp"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email,
      }),
    );
  }


  static Future<dynamic> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return await http.post(
      Uri.parse("https://mock-api.calleyacd.com/api/auth/verify-otp"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email,
        "otp": otp,
      }),
    );

  }
}
