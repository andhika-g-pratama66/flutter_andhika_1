import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/models/wallpaper_models.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/home.dart';

class WallpaperListScreen extends StatefulWidget {
  const WallpaperListScreen({super.key});

  @override
  State<WallpaperListScreen> createState() => _WallpaperListScreenState();
}

class _WallpaperListScreenState extends State<WallpaperListScreen> {
  // Variabel ini bisa digunakan nanti jika kamu ingin mengelola data di level Screen
  late List<GetWallpaper> dataWallpaper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Tambahkan AppBar jika ingin ada judul di atas
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widget Input Pencarian
              const Expanded(child: HomescreenWallpaper()),
            ],
          ),
        ),
      ),
    );
  }
}
