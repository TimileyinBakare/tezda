import 'package:riverpod/riverpod.dart';
import 'package:tezda_task/core/modules/product/data/repository/product_repository.dart';
import 'package:tezda_task/core/modules/product/model/product.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productsProvider = FutureProvider<Products>((ref) async {
  final repository = ref.read(productRepositoryProvider);
  return repository.fetchProducts();
});
