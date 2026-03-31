import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/api/get_wallpaper.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/search_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/wallpaper_detail.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/wallpaper_result.dart';

class HomescreenWallpaper extends StatefulWidget {
  const HomescreenWallpaper({super.key});

  @override
  State<HomescreenWallpaper> createState() => _HomescreenWallpaperState();
}

class _HomescreenWallpaperState extends State<HomescreenWallpaper> {
  final TextEditingController _searchController = TextEditingController();
  late Future _wallpaperFuture;

  @override
  void initState() {
    super.initState();
    _wallpaperFuture = getWallpaper();
  }

  // Fungsi untuk refresh data jika diperlukan
  void _refreshData() {
    setState(() {
      _wallpaperFuture = getWallpaper();
    });
  }

  void _navigateToResults() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WallpaperResultPage(query: query, sorting: 'date_added'),
        ),
      );
    }
  }

  void _navigateToSearchPage() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WallpaperResultPage(query: query, sorting: 'date_added'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ensure this is wrapped in a Scaffold or appropriate parent
      body: FutureBuilder(
        future: _wallpaperFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text("Error: ${snapshot.error}"),
                  ElevatedButton(
                    onPressed: _refreshData,
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final wallpapers = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async => _refreshData(),
              // --- CHANGE HERE: Use ListView to make items scrollable ---
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      canRequestFocus: false,
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Enter keyword (e.g. Anime)",
                        suffixIcon: Icon(Icons.search),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onTap: () {
                        context.push(SearchPage());
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        GridView.builder(
                          // Important: Disable GridView's own scrolling
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 0.7,
                              ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            final item = wallpapers[index];
                            return InkWell(
                              onTap: () {
                                context.push(WallpaperDescription());
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  color: Colors.grey[300],
                                  child: Image.network(
                                    item.thumbs?.large ?? "",
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Center(
                                              child: Icon(Icons.broken_image),
                                            ),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(child: Text("No wallpapers found."));
        },
      ),
    );
  }
}
