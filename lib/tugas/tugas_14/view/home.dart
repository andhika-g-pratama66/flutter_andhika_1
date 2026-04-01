import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/api/get_wallpaper.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/search_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/wallpaper_detail.dart';

class HomescreenWallpaper extends StatefulWidget {
  const HomescreenWallpaper({super.key});

  @override
  State<HomescreenWallpaper> createState() => _HomescreenWallpaperState();
}

class _HomescreenWallpaperState extends State<HomescreenWallpaper> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List wallpapers = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadWallpapers();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMore) {
        _loadWallpapers();
      }
    });
  }

  Future<void> _loadWallpapers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final newData = await getWallpaper(
        page: _page,
      ); // pastikan API support page

      setState(() {
        _page++;
        wallpapers.addAll(newData);

        if (newData.isEmpty) {
          _hasMore = false;
        }
      });
    } catch (e) {
      print("Error loading wallpapers: $e");
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      wallpapers.clear();
      _page = 1;
      _hasMore = true;
    });
    await _loadWallpapers();
  }

  void _navigateToSearchPage() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      context.push(SearchPage());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Placing the search bar in the AppBar keeps it visible
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          // 1. Make it read-only so the keyboard doesn't show up
          readOnly: true,

          decoration: InputDecoration(
            hintText: "Search wallpapers...",
            prefixIcon: const Icon(Icons.search),

            // Added filled and contentPadding to make it look like a nice search bar
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),

          // 2. Trigger navigation when the user clicks anywhere on the box
          onTap: () {
            context.push(const SearchPage());
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // The Grid section
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = wallpapers[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WallpaperDescription(id: item.id),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: item.thumbs?.large ?? "",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey[900]),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                }, childCount: wallpapers.length),
              ),
            ),

            // Loading/End of list status
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : (!_hasMore
                          ? const Center(child: Text("No more wallpapers"))
                          : const SizedBox()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
