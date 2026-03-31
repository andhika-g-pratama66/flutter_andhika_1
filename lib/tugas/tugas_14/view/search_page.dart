import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/database/preference.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/wallpaper_result.dart';
// Import your service

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _refreshHistory();
  }

  Future<void> _refreshHistory() async {
    final data = await SearchHistoryService.getHistory();
    setState(() {
      _history = data;
    });
  }

  void _handleSearch(String query) async {
    if (query.trim().isEmpty) return;

    // Save via service
    final updatedHistory = await SearchHistoryService.addToHistory(query);
    setState(() {
      _history = updatedHistory;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            WallpaperResultPage(query: query, sorting: 'date_added'),
      ),
    );
    // Navigate to results
    log("Searching for: $query");
    // Navigator.push(...)
  }

  void _deleteAll() async {
    await SearchHistoryService.clearHistory();
    setState(() {
      _history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            if (_history.isNotEmpty) _buildHistoryHeader(),
            _buildHistoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 32, left: 8),
      child: Row(
        children: [
          const BackButton(),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Enter keyword...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _handleSearch(_searchController.text),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: _handleSearch,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Recent Searches",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: _deleteAll, child: const Text("Clear All")),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final item = _history[index];
          return ListTile(
            leading: const Icon(Icons.history, color: Colors.grey),
            title: Text(item),
            trailing: const Icon(
              Icons.north_west,
              size: 18,
              color: Colors.grey,
            ),
            onTap: () {
              _searchController.text = item;
              _handleSearch(item);
            },
          );
        },
      ),
    );
  }
}
