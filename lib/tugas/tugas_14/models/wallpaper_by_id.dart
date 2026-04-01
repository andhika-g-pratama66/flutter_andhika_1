// To parse this JSON data, do
//
//     final wallpaperById = wallpaperByIdFromJson(jsonString);

import 'dart:convert';

WallpaperById wallpaperByIdFromJson(String str) =>
    WallpaperById.fromJson(json.decode(str));

String wallpaperByIdToJson(WallpaperById data) => json.encode(data.toJson());

class WallpaperById {
  DataWallpaperById? data;

  WallpaperById({this.data});

  WallpaperById copyWith({DataWallpaperById? data}) =>
      WallpaperById(data: data ?? this.data);

  factory WallpaperById.fromJson(Map<String, dynamic> json) => WallpaperById(
    data: json["data"] == null
        ? null
        : DataWallpaperById.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"data": data?.toJson()};
}

class DataWallpaperById {
  String? id;
  String? url;
  String? shortUrl;
  Uploader? uploader;
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
  List<Tag>? tags;

  DataWallpaperById({
    this.id,
    this.url,
    this.shortUrl,
    this.uploader,
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
    this.tags,
  });

  DataWallpaperById copyWith({
    String? id,
    String? url,
    String? shortUrl,
    Uploader? uploader,
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
    List<Tag>? tags,
  }) => DataWallpaperById(
    id: id ?? this.id,
    url: url ?? this.url,
    shortUrl: shortUrl ?? this.shortUrl,
    uploader: uploader ?? this.uploader,
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
    tags: tags ?? this.tags,
  );

  factory DataWallpaperById.fromJson(Map<String, dynamic> json) =>
      DataWallpaperById(
        id: json["id"],
        url: json["url"],
        shortUrl: json["short_url"],
        uploader: json["uploader"] == null
            ? null
            : Uploader.fromJson(json["uploader"]),
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
            : List<String>.from(json["colors"]!.map((x) => x)),
        path: json["path"],
        thumbs: json["thumbs"] == null ? null : Thumbs.fromJson(json["thumbs"]),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "short_url": shortUrl,
    "uploader": uploader?.toJson(),
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
    "tags": tags == null
        ? []
        : List<dynamic>.from(tags!.map((x) => x.toJson())),
  };
}

class Tag {
  int? id;
  String? name;
  String? alias;
  int? categoryId;
  String? category;
  String? purity;
  String? createdAt;

  Tag({
    this.id,
    this.name,
    this.alias,
    this.categoryId,
    this.category,
    this.purity,
    this.createdAt,
  });

  Tag copyWith({
    int? id,
    String? name,
    String? alias,
    int? categoryId,
    String? category,
    String? purity,
    String? createdAt,
  }) => Tag(
    id: id ?? this.id,
    name: name ?? this.name,
    alias: alias ?? this.alias,
    categoryId: categoryId ?? this.categoryId,
    category: category ?? this.category,
    purity: purity ?? this.purity,
    createdAt: createdAt ?? this.createdAt,
  );

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    name: json["name"],
    alias: json["alias"],
    categoryId: json["category_id"],
    category: json["category"],
    purity: json["purity"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "alias": alias,
    "category_id": categoryId,
    "category": category,
    "purity": purity,
    "created_at": createdAt,
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

class Uploader {
  String? username;
  String? group;
  Avatar? avatar;

  Uploader({this.username, this.group, this.avatar});

  Uploader copyWith({String? username, String? group, Avatar? avatar}) =>
      Uploader(
        username: username ?? this.username,
        group: group ?? this.group,
        avatar: avatar ?? this.avatar,
      );

  factory Uploader.fromJson(Map<String, dynamic> json) => Uploader(
    username: json["username"],
    group: json["group"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "group": group,
    "avatar": avatar?.toJson(),
  };
}

class Avatar {
  String? the200Px;
  String? the128Px;
  String? the32Px;
  String? the20Px;

  Avatar({this.the200Px, this.the128Px, this.the32Px, this.the20Px});

  Avatar copyWith({
    String? the200Px,
    String? the128Px,
    String? the32Px,
    String? the20Px,
  }) => Avatar(
    the200Px: the200Px ?? this.the200Px,
    the128Px: the128Px ?? this.the128Px,
    the32Px: the32Px ?? this.the32Px,
    the20Px: the20Px ?? this.the20Px,
  );

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    the200Px: json["200px"],
    the128Px: json["128px"],
    the32Px: json["32px"],
    the20Px: json["20px"],
  );

  Map<String, dynamic> toJson() => {
    "200px": the200Px,
    "128px": the128Px,
    "32px": the32Px,
    "20px": the20Px,
  };
}
