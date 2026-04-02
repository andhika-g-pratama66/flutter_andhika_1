import 'dart:developer';
import 'package:flutter_andhika_1/tugas/tugas_15/models/get_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_andhika_1/database/preference.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/api/endpoint.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

Future<GetUserModel?> updateUser({required String name}) async {
  try {
    final token = await PrefsHandler.getToken();

    if (token == null || token.isEmpty) {
      throw const ApiException("Token not found", statusCode: 401);
    }

    final response = await http.put(
      Uri.parse(Endpoint.profile),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      // Fix 5: PUT request must include a body with data to update
      body: json.encode({"name": name}),
    );

    log("STATUS CODE: ${response.statusCode}");
    log("RESPONSE BODY: ${response.body}");

    final jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      return GetUserModel.fromJson(jsonData);
    } else {
      throw ApiException(
        jsonData["message"] ?? "Failed to update user",
        statusCode: response.statusCode,
      );
    }
  } on ApiException catch (e) {
    log("API ERROR UPDATE USER: $e (status: ${e.statusCode})");
    return null;
  } catch (e) {
    log("ERROR UPDATE USER: $e");
    return null;
  }
}
