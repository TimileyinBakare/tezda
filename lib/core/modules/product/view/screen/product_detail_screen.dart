import 'package:flutter/material.dart';
import 'package:tezda_task/core/modules/product/model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              child: PageView.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(product.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: \$${product.price}',
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.green),
                      ),
                      Text(
                        'Rating: ${product.rating}',
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.orange),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Brand: ${product.brand}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Category: ${product.category}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Stock: ${product.stock}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discount: ${product.discountPercentage}% off',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Description: ${product.description}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
