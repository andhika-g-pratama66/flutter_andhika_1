import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/api/get_wallpaper.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_by_id.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_models.dart';

class WallpaperDescription extends StatefulWidget {
  final String id;
  const WallpaperDescription({super.key, required this.id});

  @override
  State<WallpaperDescription> createState() => _WallpaperDescriptionState();
}

class _WallpaperDescriptionState extends State<WallpaperDescription> {
  final ScrollController _scrollController = ScrollController();

  late String _currentId;

  @override
  void initState() {
    super.initState();
    _currentId = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dark mode background is handled by the theme in main.dart
      appBar: AppBar(title: const Text("Detail"), centerTitle: true),
      body: FutureBuilder<DataWallpaperById>(
        key: ValueKey(_currentId), //
        future: getWallpaperById(_currentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final wallpaper = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: _currentId,
                    child: CachedNetworkImage(
                      imageUrl: wallpaper.path ?? "",
                      fit: BoxFit.contain,
                      width: double.infinity,
                      fadeInDuration: Duration(milliseconds: 300),
                      placeholder: (context, url) => Container(
                        height: 200,
                        color: Colors.grey[900],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
                    child: Text(
                      "Similar Wallpapers",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 250),
                    child: FutureBuilder<List<GetWallpaper>>(
                      // Use a fallback if tags are empty to prevent crash
                      future: getWallpaper(
                        query: (wallpaper.tags?.isNotEmpty ?? false)
                            ? wallpaper.tags!
                                  .take(2)
                                  .map((e) => e.name)
                                  .join(" ")
                            : "nature",
                      ),
                      builder: (context, similarSnapshot) {
                        if (!similarSnapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final rawList = similarSnapshot.data!;
                        final similarList = rawList
                            .where((item) => item.id != _currentId)
                            .toSet()
                            .toList();

                        if (similarList.isEmpty) {
                          return const Center(
                            child: Text("No similar photos found."),
                          );
                        }

                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            itemCount: similarList.length,
                            itemBuilder: (context, index) {
                              final item = similarList[index];

                              return Container(
                                width: 180,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () {
                                      if (item.id == null) return;

                                      setState(() {
                                        _currentId = item.id!;
                                      });

                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                            _scrollController.animateTo(
                                              0,
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        key: ValueKey(item.id),
                                        imageUrl: item.thumbs?.large ?? "",
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                              color: Colors.grey[850],
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                              color: Colors.grey[800],
                                              child: const Center(
                                                child: Icon(Icons.broken_image),
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          }
          return const Center(child: Text("No data"));
        },
      ),
    );
  }
}
