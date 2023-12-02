part of 'products_page_cubit.dart';

@immutable
abstract class ProductsPageState {}

class ProductsPageInitial extends ProductsPageState {}

// ignore: must_be_immutable
class ProductsPageSuccess extends ProductsPageState {
  ProductModel productsModel;

  ProductsPageSuccess({required this.productsModel});
}

class ProductsPageError extends ProductsPageState {
  final String error;

  ProductsPageError({required this.error});
}

class ProductsPageLoading extends ProductsPageState {}
