import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../models/product_model.dart';

abstract class ProductRemoteDS {
  Future<Either<Failures, ProductModel>> getProducts();
}
