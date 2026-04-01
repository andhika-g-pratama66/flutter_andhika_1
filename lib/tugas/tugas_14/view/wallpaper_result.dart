import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/api/get_wallpaper.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_models.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/wallpaper_detail.dart';

class WallpaperResultPage extends StatefulWidget {
  final String query;
  final String sorting;

  const WallpaperResultPage({
    super.key,
    required this.query,
    required this.sorting,
  });

  @override
  State<WallpaperResultPage> createState() => _WallpaperResultPageState();
}

class _WallpaperResultPageState extends State<WallpaperResultPage> {
  final ScrollController _scrollController = ScrollController();

  final List<GetWallpaper> _wallpapers = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchWallpapers();
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
      _fetchWallpapers();
    }
  }

  Future<void> _fetchWallpapers() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final results = await getWallpaper(
        query: widget.query,
        sorting: widget.sorting,
        page: _page,
      );

      if (!mounted) return;

      setState(() {
        _wallpapers.addAll(results);
        // FIX: increment only on success, after we know the result size
        if (results.length < 24) {
          _hasMore = false;
        } else {
          _page++;
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString());
      debugPrint('Error fetching wallpapers: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _wallpapers.clear();
      _page = 1;
      _hasMore = true;
      _error = null;
    });
    await _fetchWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.query),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // First load — show shimmer grid to match HomescreenWallpaper
    if (_wallpapers.isEmpty && _isLoading) {
      return _buildShimmerGrid();
    }

    // First load failed
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
              onPressed: _fetchWallpapers,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    // Empty result
    if (_wallpapers.isEmpty) {
      return const Center(child: Text('No wallpapers found for this search.'));
    }

    // FIX: use CustomScrollView + SliverGrid to match HomescreenWallpaper layout
    return RefreshIndicator(
      onRefresh: _refresh,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8),
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

  // FIX: renamed from _buildWallpaperTile, uses CachedNetworkImage
  Widget _buildWallpaperCard(GetWallpaper item) {
    // FIX: null-safe id check instead of force-unwrap crash
    final id = item.id;
    if (id == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WallpaperDescription(id: id)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: item.thumbs?.large ?? '',
          fit: BoxFit.cover,
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
    // FIX: inline error state for pagination failures
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
                onPressed: _fetchWallpapers,
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
            "You've reached the end", // FIX: no escape needed with double quotes
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

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

// Shared shimmer — copy this to a common widgets file if used in multiple pages
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
