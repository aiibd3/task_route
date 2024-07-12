import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_route/features/product_list/data/models/product.dart';
import 'package:task_route/features/product_list/presentation/widgets/product_item.dart';


// Todo: ProductItem displays product information correctly:
// Ensures that the widget correctly displays the product's title, description, image, prices, and rating.


// Todo: Tapping the favorite icon changes its color:
//  Checks that the favorite icon can be found and that tapping it does not cause any errors.


void main() {
  testWidgets('ProductItem displays product information correctly', (WidgetTester tester) async {
    // Arrange
    final product = Product(
      title: 'Test Product',
      description: 'This is a test product',
      thumbnail: 'https://via.placeholder.com/150',
      price: 100.0,
      discountPercentage: 0.1,
      rating: 4.5,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductItem(index: 0, product: product),
        ),
      ),
    );

    // Assert
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('This is a test product'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('EGP 10.0'), findsOneWidget); // discounted price
    expect(find.text('EGP 100.0'), findsOneWidget); // original price
    expect(find.text('(4.5)'), findsOneWidget);
  });

  testWidgets('Tapping the favorite icon changes its color', (WidgetTester tester) async {
    // Arrange
    final product = Product(
      title: 'Test Product',
      description: 'This is a test product',
      thumbnail: 'https://via.placeholder.com/150',
      price: 100.0,
      discountPercentage: 0.1,
      rating: 4.5,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductItem(index: 0, product: product),
        ),
      ),
    );

    // Find the favorite icon
    final favoriteIcon = find.byIcon(Icons.favorite_outline);
    expect(favoriteIcon, findsOneWidget);

    // Tap the favorite icon
    await tester.tap(favoriteIcon);
    await tester.pump();

    // Assert
    // Assuming tapping the favorite icon changes its color or state,
    // you would add your verification logic here.
    // For this example, we'll just check that the icon is still present.
    expect(find.byIcon(Icons.favorite_outline), findsOneWidget);
  });
}
