class MakananModel {
  final int id;
  final String namaMakanan;
  final int harga;
  final String deskripsi;
  final String gambar;

  MakananModel({
    required this.id,
    required this.namaMakanan,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
  });

 
  factory MakananModel.fromJson(Map<String, dynamic> json) {
    final int categoryId =
        int.tryParse(json['idCategory']?.toString() ?? '1') ?? 1;

  
    final int defaultHarga = 20000 + ((categoryId % 4) * 5000);

    return MakananModel(
      id: categoryId,
      namaMakanan: json['strCategory'] ?? json['namaMakanan'] ?? 'Menu Makanan',
      harga: int.tryParse(json['harga']?.toString() ?? '') ?? defaultHarga,
      deskripsi: json['strCategoryDescription'] ?? json['deskripsi'] ?? '-',
      gambar: json['strCategoryThumb'] ?? json['gambar'] ?? '',
    );
  }
}


final List<MakananModel> dummyMakananList = [
  MakananModel(
    id: 1,
    namaMakanan: 'Nasi Goreng Spesial',
    harga: 25000,
    deskripsi:
        'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
    gambar:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcUEWPoXweP6F6Y6UKjoFbEz8y2UtLuQnbih__on5qAA&s=10',
  ),
  MakananModel(
    id: 2,
    namaMakanan: 'Ayam Bakar Madu',
    harga: 30000,
    deskripsi:
        'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
    gambar:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaH9D2WTvvhJiK_Yy56ea1k5TQDy0vtx9b68Rr1jiQ5g&s=10',
  ),
  MakananModel(
    id: 3,
    namaMakanan: 'Sate Ayam Madura',
    harga: 28000,
    deskripsi:
        '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
    gambar:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-9-ZBb3EUrl-W6hGto151fV2DK0BQQbJtxxZbMyxdnQ&s=10',
  ),
  MakananModel(
    id: 4,
    namaMakanan: 'Mie Ayam Bakso',
    harga: 20000,
    deskripsi:
        'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
    gambar:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJB2Fhy-dgPo6aaQKJJ0vKa2tPdbvRoixpG7JyiRnCQQ&s=10',
  ),
  MakananModel(
    id: 5,
    namaMakanan: 'Es Teh Manis Jumbo',
    harga: 8000,
    deskripsi:
        'Minuman teh melati segar dengan gula asli dan es batu kristal.',
    gambar:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFS3wX2qpXdOQKw4fNcrtdK0l269fh4DCRk3Pq-RyOUA&s=10',
  ),
];
