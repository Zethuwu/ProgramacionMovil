import 'package:firebase_database/firebase_database.dart';
import 'Producto.dart';

class ProductService {
  final DatabaseReference _productsRef = FirebaseDatabase.instance.reference()
      .child('productos');

  Future<void> saveProduct(Producto producto) async {
    await _productsRef.push().set(producto.toMap());
  }
  Future<void> deleteProduct(String productId) async {
    await _productsRef.child(productId).remove();
  }

  Future<List<Producto>> getProducts() async {
    DatabaseEvent product = await _productsRef.once();
    DataSnapshot snapshot = product.snapshot;
    List<Producto> productos = [];

    if (snapshot != null && snapshot.value != null) {
      print("Datos de la base de datos: ${snapshot.value}");
      Map? data = snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        data.forEach((key, value) {
          if (value != null && value is Map<dynamic, dynamic>) {
            Producto produc = Producto(
              id: key.toString(),
              nomProducto: value['nomProducto'].toString(),
              precio: double.tryParse(value['precio'].toString()) ?? 0.0,
              descripcion: value['descripcion'].toString(),
            );
            productos.add(produc);
          }
        });
      }
    }

    return productos;
  }
}
