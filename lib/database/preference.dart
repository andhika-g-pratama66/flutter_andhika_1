import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryService {
  static const String _key = 'search_history';

  // Load history
  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  // Save history
  static Future<void> saveHistory(List<String> history) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, history);
  }

  // Add a single item
  static Future<List<String>> addToHistory(String query) async {
    List<String> history = await getHistory();
    query = query.trim();

    if (query.isNotEmpty) {
      history.remove(query); // Remove duplicate
      history.insert(0, query); // Add to top
      if (history.length > 10) history.removeLast(); // Limit size
      await saveHistory(history);
    }
    return history;
  }

  // Clear all
  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

class PrefsHandler {
  static const String _token = 'token';
  static Future<void> storingToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    var data = prefs.getString(_token);
    return data;
  }

  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
  }
}
