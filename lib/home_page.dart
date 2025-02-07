import 'package:flutter/material.dart';
import 'product.dart';
import 'product_details.dart';

class MyHomePage extends StatelessWidget {
  final List<Product> products = [
    Product(name: "iPhone", description: "iPhone is the most productive phone ever", price: 1000, image: "assets/appimages/iphone.png"),
    Product(name: "Pixel", description: "Pixel is the most featureful phone ever", price: 800, image: "assets/appimages/pixel.webp"),
    Product(name: "Laptop", description: "Laptop is the most productive development tool", price: 2000, image: "assets/appimages/laptop.webp"),
    Product(name: "Tablet", description: "Tablet is the most useful device for meetings", price: 1500, image: "assets/appimages/tablet.jpg"),
    Product(name: "Pendrive", description: "Pendrive is a useful storage medium", price: 100, image: "assets/appimages/pendrive.webp"),
    Product(name: "Floppy Drive", description: "Floppy Drive is a useful rescue storage medium", price: 20, image: "assets/appimages/floppy.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Navigation")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(products[index].image, width: 50, height: 50),
              title: Text(products[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products[index].description),
                  Text("Price: \$${products[index].price}"),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(Icons.star_border, size: 20);
                    }),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(product: products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}