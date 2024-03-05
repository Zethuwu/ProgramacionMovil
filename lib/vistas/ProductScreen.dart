import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../firebase/ProductService.dart';
import '../firebase/Producto.dart';
import 'package:flutter/material.dart';


class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final ProductService _productService = ProductService();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrar Productos'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombre del Producto'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Precio'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Descripción'),
                  maxLines: 3,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: Text('Agregar Producto'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: FutureBuilder<List<Producto>>(
              future: _productService.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<Producto> productos = snapshot.data!;
                  return ListView.builder(
                    itemCount: productos.length,
                    itemBuilder: (context, index) {
                      Producto producto = productos[index];
                      return ListTile(
                        title: Text(producto.nomProducto),
                        // Modifica esta línea para manejar el valor nulo del precio
                        subtitle: Text(producto.precio != null ? 'Precio: \$${producto.precio.toStringAsFixed(2)}' : ''),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteProduct(producto.id);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No hay productos disponibles'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  void _addProduct() {
    String name = _nameController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String description = _descriptionController.text;

    if (name.isNotEmpty && price > 0) {
      Producto producto = Producto(
        id: '',
        nomProducto: name,
        precio: price,
        descripcion: description,
      );
      _productService.saveProduct(producto).then((_) {
        _nameController.clear();
        _priceController.clear();
        _descriptionController.clear();
        setState(() {}); // Actualizar la vista para mostrar el nuevo producto agregado
      }).catchError((error) {
        print('Error al guardar el producto: $error');
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Por favor, ingrese un nombre y un precio válido para el producto.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _deleteProduct(String productId) {
    _productService.deleteProduct(productId).then((_) {
      setState(() {}); // Actualizar la vista para reflejar el producto eliminado
    }).catchError((error) {
      print('Error al eliminar el producto: $error');
    });
  }
}
