import 'dart:convert';
import 'dart:developer';

import 'package:flutter_andhika_1/database/preference.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/api/endpoint.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/models/get_user.dart';
import 'package:http/http.dart' as http;

Future<GetUserModel?> getUser() async {
  try {
    final token = await PrefsHandler.getToken();

    log("TOKEN: $token");
    log("ENDPOINT PROFILE: ${Endpoint.profile}");

    if (token == null || token.isEmpty) {
      throw Exception("Token not found");
    }

    final response = await http.get(
      Uri.parse(Endpoint.profile),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    log("STATUS CODE: ${response.statusCode}");
    log("RESPONSE BODY: ${response.body}");

    final jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      return GetUserModel.fromJson(jsonData);
    } else {
      throw Exception(jsonData["message"] ?? "Failed to get user data");
    }
  } catch (e) {
    log("ERROR GET USER: $e");
    return null;
  }
}
