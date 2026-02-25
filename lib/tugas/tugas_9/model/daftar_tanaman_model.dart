import 'dart:convert';

List<DaftarTanaman> daftarTanamanFromJson(String str) =>
    List<DaftarTanaman>.from(
      json.decode(str).map((x) => DaftarTanaman.fromJson(x)),
    );

String daftarTanamanToJson(List<DaftarTanaman> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DaftarTanaman {
  String? nama;
  String? kategori;
  String? imgUrl;

  DaftarTanaman({this.nama, this.kategori, this.imgUrl});

  factory DaftarTanaman.fromJson(Map<String, dynamic> json) => DaftarTanaman(
    nama: json["nama"],
    kategori: json["kategori"],
    imgUrl: json["imgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "kategori": kategori,
    "imgUrl": imgUrl,
  };
}
