import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/product_model.dart';

abstract class ProductListRepo {
  Future<Either<Failures, ProductModel>> getProductList();
}
