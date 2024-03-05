class Producto {
  final String id;
  final String nomProducto;
  final double precio;
  final String descripcion;

  Producto({
    required this.id,
    required this.nomProducto,
    required this.precio,
    required this.descripcion,
  });

  factory Producto.fromMap(Map<String, dynamic> map) {
    print("Valores del mapa: $map");
    return Producto(
      id: map['id'],
      nomProducto: map['nomProducto'],
      precio: map['precio'],
      descripcion: map['descripcion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomProducto': nomProducto,
      'precio': precio,
      'descripcion': descripcion,
    };
  }
}