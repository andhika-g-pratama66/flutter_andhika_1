import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/api/get_wallpaper.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_models.dart';

class WallpaperResultPage extends StatelessWidget {
  final String query; // Receive the search term
  final String sorting;
  const WallpaperResultPage({
    super.key,
    required this.query,
    required this.sorting,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(query)),
      body: FutureBuilder<List<GetWallpaper>>(
        // Pass the query from the constructor to the API function
        future: getWallpaper(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final wallpapers = snapshot.data!;
            return ListView.builder(
              itemCount: wallpapers.length,
              itemBuilder: (context, index) {
                final item = wallpapers[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      item.thumbs?.large ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text("No wallpapers found for this search."),
          );
        },
      ),
    );
  }
}
