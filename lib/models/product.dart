class Product {
  final int id;
  final String name;

  Product({required this.id, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id']),
      name: json['name'],
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
  Product(id: 1, name: 'PA 1'),
  Product(id: 2, name: 'PA 2'),
];
