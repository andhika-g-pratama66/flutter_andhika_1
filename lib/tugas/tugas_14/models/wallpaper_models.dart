// To parse this JSON data, do
//
//     final wallpaperModels = wallpaperModelsFromJson(jsonString);

import 'dart:convert';

WallpaperModels wallpaperModelsFromJson(String str) =>
    WallpaperModels.fromJson(json.decode(str));

String wallpaperModelsToJson(WallpaperModels data) =>
    json.encode(data.toJson());

class WallpaperModels {
  List<GetWallpaper>? data;
  Meta? meta;

  WallpaperModels({this.data, this.meta});

  WallpaperModels copyWith({List<GetWallpaper>? data, Meta? meta}) =>
      WallpaperModels(data: data ?? this.data, meta: meta ?? this.meta);

  factory WallpaperModels.fromJson(Map<String, dynamic> json) =>
      WallpaperModels(
        data: json["data"] == null
            ? []
            : List<GetWallpaper>.from(
                json["data"]!.map((x) => GetWallpaper.fromJson(x)),
              ),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class GetWallpaper {
  String? id;
  String? url;
  String? shortUrl;
  int? views;
  int? favorites;
  String? source;
  String? purity;
  String? category;
  int? dimensionX;
  int? dimensionY;
  String? resolution;
  String? ratio;
  int? fileSize;
  String? fileType;
  String? createdAt;
  List<String>? colors;
  String? path;
  Thumbs? thumbs;

  GetWallpaper({
    this.id,
    this.url,
    this.shortUrl,
    this.views,
    this.favorites,
    this.source,
    this.purity,
    this.category,
    this.dimensionX,
    this.dimensionY,
    this.resolution,
    this.ratio,
    this.fileSize,
    this.fileType,
    this.createdAt,
    this.colors,
    this.path,
    this.thumbs,
  });

  GetWallpaper copyWith({
    String? id,
    String? url,
    String? shortUrl,
    int? views,
    int? favorites,
    String? source,
    String? purity,
    String? category,
    int? dimensionX,
    int? dimensionY,
    String? resolution,
    String? ratio,
    int? fileSize,
    String? fileType,
    String? createdAt,
    List<String>? colors,
    String? path,
    Thumbs? thumbs,
  }) => GetWallpaper(
    id: id ?? this.id,
    url: url ?? this.url,
    shortUrl: shortUrl ?? this.shortUrl,
    views: views ?? this.views,
    favorites: favorites ?? this.favorites,
    source: source ?? this.source,
    purity: purity ?? this.purity,
    category: category ?? this.category,
    dimensionX: dimensionX ?? this.dimensionX,
    dimensionY: dimensionY ?? this.dimensionY,
    resolution: resolution ?? this.resolution,
    ratio: ratio ?? this.ratio,
    fileSize: fileSize ?? this.fileSize,
    fileType: fileType ?? this.fileType,
    createdAt: createdAt ?? this.createdAt,
    colors: colors ?? this.colors,
    path: path ?? this.path,
    thumbs: thumbs ?? this.thumbs,
  );

  factory GetWallpaper.fromJson(Map<String, dynamic> json) => GetWallpaper(
    id: json["id"],
    url: json["url"],
    shortUrl: json["short_url"],
    views: json["views"],
    favorites: json["favorites"],
    source: json["source"],
    purity: json["purity"],
    category: json["category"],
    dimensionX: json["dimension_x"],
    dimensionY: json["dimension_y"],
    resolution: json["resolution"],
    ratio: json["ratio"],
    fileSize: json["file_size"],
    fileType: json["file_type"],
    createdAt: json["created_at"],
    colors: json["colors"] == null
        ? []
        : List<String>.from(json["colors"].map((x) => x.toString())),
    path: json["path"],
    thumbs: json["thumbs"] == null ? null : Thumbs.fromJson(json["thumbs"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "short_url": shortUrl,
    "views": views,
    "favorites": favorites,
    "source": source,
    "purity": purity,
    "category": category,
    "dimension_x": dimensionX,
    "dimension_y": dimensionY,
    "resolution": resolution,
    "ratio": ratio,
    "file_size": fileSize,
    "file_type": fileType,
    "created_at": createdAt,
    "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
    "path": path,
    "thumbs": thumbs?.toJson(),
  };
}

class Thumbs {
  String? large;
  String? original;
  String? small;

  Thumbs({this.large, this.original, this.small});

  Thumbs copyWith({String? large, String? original, String? small}) => Thumbs(
    large: large ?? this.large,
    original: original ?? this.original,
    small: small ?? this.small,
  );

  factory Thumbs.fromJson(Map<String, dynamic> json) => Thumbs(
    large: json["large"],
    original: json["original"],
    small: json["small"],
  );

  Map<String, dynamic> toJson() => {
    "large": large,
    "original": original,
    "small": small,
  };
}

class Meta {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;
  dynamic query;
  dynamic seed;

  Meta({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.query,
    this.seed,
  });

  Meta copyWith({
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
    dynamic query,
    dynamic seed,
  }) => Meta(
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
    perPage: perPage ?? this.perPage,
    total: total ?? this.total,
    query: query ?? this.query,
    seed: seed ?? this.seed,
  );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    lastPage: json["last_page"],
    perPage: json["per_page"],
    total: json["total"],
    query: json["query"],
    seed: json["seed"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "last_page": lastPage,
    "per_page": perPage,
    "total": total,
    "query": query,
    "seed": seed,
  };
}
