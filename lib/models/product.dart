class Product {
  final int id;
  final String name;
  final String description;
  final String premi;
  final List<String> benefit;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.premi,
    required this.benefit,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id']),
      name: json['name'],
      description: json['name'],
      premi: json['name'],
      benefit: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

List<Product> userProducts = [
  Product(
    id: 1,
    name: 'Asuransi Personal Accident',
    description:
        'Periode Pertanggungan 1 tahun, sejak tanggal konfirmasi atau TBA ( To Be Announce)',
    premi: '500000 / tahun',
    benefit: [
      'santunan kematian akibat kecelakaan 250.000.000',
      'cacat tetap akibat kecelakaan 300.000.000',
      'biaya pengobatan akibat kecelakaan 25.000.000',
      'santunan tunai harian apabila dirawat inap (max 14 hari/thn) 2.500.000 per hari',
      'santunan biaya pemakaman akibat sakit dan kecelakaan 25.000.000',
    ],
  ),
];
