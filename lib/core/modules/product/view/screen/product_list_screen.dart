// product_list_screen.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_task/core/modules/product/data/provider/favourite_provider.dart';
import 'package:tezda_task/core/modules/product/data/provider/page_provider.dart';
import 'package:tezda_task/core/modules/product/view/screen/favourites.dart';
import 'package:tezda_task/core/modules/product/view/widgets/product_card.dart';


class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider);
    final favoriteProducts = ref.watch(favoriteProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteScreen()),
              );
            },
          ),
        ],
      ),
      body: productsAsyncValue.when(
        data: (products) {
          if (products.products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          return ListView.builder(
            itemCount: products.products.length,
            itemBuilder: (context, index) {
              final product = products.products[index];
              final isFavorite = favoriteProducts.contains(product);

              return ProductCard(product: product, isFavorite: isFavorite);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          log(error.toString());
          return const Center(
              child: Text('An error occurred while fetching products.'));
        },
      ),
    );
  }
}

