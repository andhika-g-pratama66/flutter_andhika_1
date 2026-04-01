import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/api/get_wallpaper.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_models.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/search_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/wallpaper_detail.dart';

class HomescreenWallpaper extends StatefulWidget {
  const HomescreenWallpaper({super.key});

  @override
  State<HomescreenWallpaper> createState() => _HomescreenWallpaperState();
}

class _HomescreenWallpaperState extends State<HomescreenWallpaper> {
  final ScrollController _scrollController = ScrollController();

  List<GetWallpaper> _wallpapers = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadWallpapers();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 200) {
      _loadWallpapers();
    }
  }

  Future<void> _loadWallpapers() async {
    // FIX: guard inside the method itself, not just in the listener
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final newData = await getWallpaper(page: _page);

      if (!mounted) return;

      setState(() {
        // FIX: only increment page after a successful fetch
        _page++;
        _wallpapers.addAll(newData);
        // FIX: consistent < 24 check, same as WallpaperResultPage
        if (newData.length < 24) _hasMore = false;
      });
    } catch (e) {
      if (!mounted) return;
      // FIX: surface the error instead of silently swallowing it
      setState(() => _error = e.toString());
      // FIX: use debugPrint instead of print
      debugPrint('Error loading wallpapers: $e');
    } finally {
      // FIX: _isLoading always resets, even on exception
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _wallpapers.clear();
      _page = 1;
      _hasMore = true;
      _error = null;
    });
    await _loadWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        title: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Search wallpapers...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          onTap: () => context.push(const SearchPage()),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // First load
    if (_wallpapers.isEmpty && _isLoading) {
      return _buildShimmerGrid();
    }

    // First load error
    if (_wallpapers.isEmpty && _error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              'Failed to load wallpapers',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadWallpapers,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildWallpaperCard(_wallpapers[index]),
                childCount: _wallpapers.length,
              ),
            ),
          ),
          SliverToBoxAdapter(child: _buildBottomIndicator()),
        ],
      ),
    );
  }

  Widget _buildWallpaperCard(GetWallpaper item) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WallpaperDescription(id: item.id!),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: item.thumbs?.large ?? '',
          fit: BoxFit.cover,
          // FIX: animated shimmer placeholder instead of static grey box
          placeholder: (context, url) => _ShimmerBox(),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[900],
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomIndicator() {
    if (_error != null && _wallpapers.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text(
                'Failed to load more',
                style: TextStyle(color: Colors.grey[600]),
              ),
              TextButton(
                onPressed: _loadWallpapers,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (!_hasMore) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No more wallpapers',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  // Shimmer grid shown on first load
  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemCount: 10,
      itemBuilder: (_, __) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _ShimmerBox(),
      ),
    );
  }
}

// Self-contained animated shimmer widget — no external package needed
class _ShimmerBox extends StatefulWidget {
  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) =>
          Container(color: Colors.grey.withOpacity(_animation.value)),
    );
  }
}
