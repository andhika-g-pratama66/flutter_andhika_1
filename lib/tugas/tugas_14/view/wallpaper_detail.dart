import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/api/get_wallpaper.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_by_id.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_models.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/widget/shimmer_box.dart';

class WallpaperDescription extends StatefulWidget {
  final String id;
  const WallpaperDescription({super.key, required this.id});

  @override
  State<WallpaperDescription> createState() => _WallpaperDescriptionState();
}

class _WallpaperDescriptionState extends State<WallpaperDescription> {
  // FIX: attach controller to the actual ScrollView
  final ScrollController _scrollController = ScrollController();

  late String _currentId;

  // FIX: cache futures so setState doesn't re-trigger API calls
  late Future<DataWallpaperById> _wallpaperFuture;
  Future<List<GetWallpaper>>? _similarFuture;

  @override
  void initState() {
    super.initState();
    _currentId = widget.id;
    _wallpaperFuture = getWallpaperById(_currentId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadSimilar(DataWallpaperById wallpaper) {
    final query = (wallpaper.tags?.isNotEmpty ?? false)
        ? wallpaper.tags!.take(2).map((e) => e.name).join(' ')
        : 'nature';
    // Only assign once — avoids re-fetching on every rebuild
    _similarFuture ??= getWallpaper(query: query);
  }

  void _onSimilarTap(String id) {
    if (id == _currentId) return;
    setState(() {
      _currentId = id;
      _wallpaperFuture = getWallpaperById(id);
      _similarFuture = null; // reset so similar reloads for new wallpaper
    });

    // FIX: controller is now actually attached — this will work
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // FIX: more descriptive than "Detail"
        title: Text('Detail'),
        centerTitle: true,
      ),
      body: FutureBuilder<DataWallpaperById>(
        // FIX: use cached future — not rebuilt on every setState
        future: _wallpaperFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // FIX: friendly error state with retry
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
                  const SizedBox(height: 12),
                  Text(
                    'Failed to load wallpaper',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    snapshot.error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => setState(() {
                      _wallpaperFuture = getWallpaperById(_currentId);
                    }),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Wallpaper not found.'));
          }

          final wallpaper = snapshot.data!;
          // Trigger similar fetch once data is available
          _loadSimilar(wallpaper);

          return SingleChildScrollView(
            // FIX: controller now actually attached to the scrollable
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'wallpaper-$_currentId',
                  child: CachedNetworkImage(
                    imageUrl: wallpaper.path ?? '',
                    fit: BoxFit.contain,
                    width: double.infinity,
                    fadeInDuration: const Duration(milliseconds: 300),
                    // FIX: shimmer placeholder instead of spinner-in-a-box
                    placeholder: (context, url) =>
                        SizedBox(height: 300, child: ShimmerBox()),
                    errorWidget: (context, url, error) => SizedBox(
                      height: 300,
                      child: Container(
                        color: Colors.grey[900],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
                  child: Text(
                    'Similar Wallpapers',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 250),
                  child: FutureBuilder<List<GetWallpaper>>(
                    future: _similarFuture,
                    builder: (context, similarSnapshot) {
                      if (similarSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // FIX: error state with retry for similar section
                      if (similarSnapshot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Could not load similar wallpapers',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () =>
                                    setState(() => _similarFuture = null),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      if (!similarSnapshot.hasData) return const SizedBox();

                      final rawList = similarSnapshot.data!;

                      // FIX: deduplicate by id, not by object identity
                      final seen = <String>{};
                      final similarList = rawList
                          .where(
                            (item) =>
                                item.id != null &&
                                item.id != _currentId &&
                                seen.add(item.id!),
                          )
                          .toList();

                      if (similarList.isEmpty) {
                        return const Center(
                          child: Text('No similar wallpapers found.'),
                        );
                      }

                      // FIX: AnimatedSwitcher for fade-in when content changes
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: ListView.builder(
                          key: ValueKey(_currentId),
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: similarList.length,
                          itemBuilder: (context, index) {
                            final item = similarList[index];
                            return _buildSimilarCard(item);
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
        },
      ),
    );
  }

  Widget _buildSimilarCard(GetWallpaper item) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (item.id == null) return;
            _onSimilarTap(item.id!);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              key: ValueKey(item.id),
              imageUrl: item.thumbs?.large ?? '',
              fit: BoxFit.cover,
              // FIX: shimmer instead of spinner-in-a-box
              placeholder: (context, url) => ShimmerBox(),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[800],
                child: const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
