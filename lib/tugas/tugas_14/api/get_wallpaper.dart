import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_models.dart';

// update in get_wallpaper.dart
Future<List<GetWallpaper>> getWallpaper({
  String query = "",
  String sorting = "views",
}) async {
  try {
    // Add the 'q' parameter for searching
    final Uri url = Uri.parse("https://wallhaven.cc/api/v1/search").replace(
      queryParameters: {if (query.isNotEmpty) 'q': query, 'sorting': sorting},
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> dataList = responseData["data"];
      return dataList.map((json) => GetWallpaper.fromJson(json)).toList();
    } else {
      throw Exception("Server Error: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Gagal memuat data: $e");
  }
}
