import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_andhika_1/tugas/tugas_15/api/endpoint.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/models/login_model.dart';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

const Map<String, String> _jsonHeaders = {
  "Accept": "application/json",
  "Content-Type": "application/json",
};
Future<LoginModel?> loginUser({
  required String email,
  required String password,
}) async {
  try {
    final response = await http
        .post(
          Uri.parse(Endpoint.login),
          headers: _jsonHeaders,
          body: jsonEncode({"email": email, "password": password}),
        )
        .timeout(const Duration(seconds: 30));

    log('[Login] status: ${response.statusCode}');
    log('[Login] body: ${response.body}');

    final decoded = json.decode(response.body) as Map<String, dynamic>;

    switch (response.statusCode) {
      case 200:
        return LoginModel.fromJson(decoded);

      case 400:
        throw ApiException(
          decoded['message'] ?? 'Request tidak valid.',
          statusCode: 400,
        );

      case 401:
        throw ApiException(
          decoded['message'] ?? 'Email atau password salah.',
          statusCode: 401,
        );

      case 422:
        final errors = decoded['errors'] as Map<String, dynamic>?;
        final firstError = errors?.values.firstOrNull;
        final msg =
            (firstError is List ? firstError.first : null) ??
            decoded['message'] ??
            'Data tidak valid.';
        throw ApiException(msg, statusCode: 422);

      case 500:
        throw ApiException(
          'Server sedang bermasalah, coba beberapa saat lagi.',
          statusCode: 500,
        );

      default:
        throw ApiException(
          decoded['message'] ?? 'Terjadi kesalahan (${response.statusCode}).',
          statusCode: response.statusCode,
        );
    }
  } on SocketException {
    throw const ApiException('Tidak ada koneksi internet.');
  } on TimeoutException {
    throw const ApiException('Koneksi timeout, coba lagi.');
  } on FormatException {
    throw const ApiException('Response dari server tidak valid.');
  }
}
