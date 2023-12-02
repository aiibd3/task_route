import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/product_model.dart';
import '../repositories/product_list_repo.dart';

class ProductListUseCase {
  ProductListRepo productListRepo;

  ProductListUseCase(this.productListRepo);
  Future<Either<Failures, ProductModel>> call() =>
      productListRepo.getProductList();
}
