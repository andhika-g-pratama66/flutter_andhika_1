import 'package:flutter/material.dart';

class ListMapTugas9 extends StatelessWidget {
  ListMapTugas9({super.key});
  final List<Map<String, dynamic>> daftarTanaman = [
    {
      "nama": "Pisang",
      "kategori": "Buah-buahan",
      "imgUrl":
          "https://images.alodokter.com/dk0z4ums3/image/upload/v1627458123/attached_image/sehat-tiap-hari-berkat-manfaat-pisang-0-alodokter.jpg",
    },
    {
      "nama": "Apel",
      "kategori": "Buah-buahan",
      "imgUrl":
          "https://images.alodokter.com/dk0z4ums3/image/upload/v1630331721/attached_image/jarang-bertemu-dokter-berkat-manfaat-apel-0-alodokter.jpg",
    },
    {
      "nama": "Daun Sirih",
      "kategori": "Herbal",
      "imgUrl":
          "https://static.honestdocs.id/989x500/webp/system/blog_articles/main_hero_images/000/003/197/original/Daun_Sirih_dan_Manfaat_Ajaibnya.jpg",
    },
    {
      "nama": "Mawar",
      "kategori": "Bunga",
      "imgUrl":
          "https://asset.kompas.com/crops/Ahi6gSzfV4IpyW-ifHb3F2nSGQU=/3x27:921x640/1200x800/data/photo/2022/09/09/631aa84b385fd.jpg",
    },
    {
      "nama": "Melati",
      "kategori": "Bunga",
      "imgUrl":
          "https://images.alodokter.com/dk0z4ums3/image/upload/v1603180135/attached_image/memetik-manfaat-bunga-melati-bagi-kesehatan-dan-kecantikan-0-alodokter.jpg",
    },
    {
      "nama": "Kaktus",
      "kategori": "Sukulen",
      "imgUrl":
          "https://akcdn.detik.net.id/api/wm/2020/08/07/tanaman-hias-kaktus_169.jpeg?w=650",
    },
    {
      "nama": "Wortel",
      "kategori": "Sayuran",
      "imgUrl":
          "https://images.alodokter.com/dk0z4ums3/image/upload/v1595842756/attached_image/manfaat-wortel-bagi-kesehatan-0-alodokter.jpg",
    },
    {
      "nama": "Bunga Kol",
      "kategori": "Sayuran",
      "imgUrl":
          "https://asset.kompas.com/crops/40s5XvsC6XR4pq5Fjm3YNaBi52w=/0x0:0x0/750x500/data/photo/2022/12/04/638c00594b6eb.jpg",
    },
    {
      "nama": "Jeruk",
      "kategori": "Buah-buahan",
      "imgUrl":
          "https://cimaung-cikeusal.desa.id/wp-content/uploads/2021/09/istockphoto-1140677637-612x612-1.jpg",
    },
    {
      "nama": "Bunga Kamboja",
      "kategori": "Bunga",
      "imgUrl":
          "https://cdn1-production-images-kly.akamaized.net/X3oD8uGRgPlFIIEd1XIMwsJlyng=/1280x720/smart/filters:quality(75):strip_icc()/kly-media-production/medias/4899189/original/080904200_1721722990-plumeria-209905_1280.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: daftarTanaman.length,

        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text(daftarTanaman[index]['nama']),
            subtitle: Text(daftarTanaman[index]['kategori']),
            leading: Image.network(width: 100, daftarTanaman[index]['imgUrl']),
          );
        },
      ),
    );
  }
}
