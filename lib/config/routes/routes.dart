import 'package:flutter/material.dart';

import '../../features/product_list/presentation/pages/product_list.dart';

class AppRoute {
  static const String productList = "/";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.productList:
        return MaterialPageRoute(
            builder: (context) => const ProductListScreen());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
