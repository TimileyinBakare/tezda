
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/src/framework.dart';
import 'package:tezda_task/core/modules/product/data/provider/page_provider.dart';
import 'package:tezda_task/core/modules/product/model/product.dart';
import 'package:tezda_task/core/modules/product/view/screen/product_list_screen.dart';
import 'package:tezda_task/core/modules/product/view/widgets/product_card.dart';

class MockProductsProvider extends Mock implements FutureProvider<Products> {}

void main() {
  late MockProductsProvider mockProductsProvider;

  setUp(() {
    mockProductsProvider = MockProductsProvider();
  });

  testWidgets('ProductListScreen displays products correctly', (WidgetTester tester) async {
    // Mock products provider to return sample data
    when(mockProductsProvider.read(productsProvider as Node)).thenReturn(
      FutureProvider<Products>((ref) async {
        await Future.delayed(const Duration(seconds: 1));
        return Products(products: [
          Product(
            id: 1,
            title: 'Product 1',
            description: 'Description 1',
            price: 10.0.toInt(),
            thumbnail: 'https://example.com/product1.jpg', images: ["0","1"], discountPercentage: 2, rating: 5, stock: 5, brand: 'food', category: 'love',
          ),
          // Add more products as needed
        ], total: 5, skip: 1, limit: 1);
      }) as AsyncValue<Products>,
    );

    // Build our app and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            productsProvider.overrideWithProvider(mockProductsProvider),
            // Add other providers if needed
          ],
          child: const ProductListScreen(),
        ),
      ),
    );

    // Wait for products to load
    await tester.pump();

    // Verify that the product list is displayed correctly
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Description 1'), findsOneWidget);
    expect(find.text('\$10.0'), findsOneWidget);
    expect(find.byType(ProductCard), findsOneWidget);
  });
}
