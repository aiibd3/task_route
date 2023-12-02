import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_route/features/product_list/data/models/product_model.dart';

import '../../../../core/api/api_manager.dart';
import '../../data/data_sources/remote_ds/product_list_ds.dart';
import '../../data/data_sources/remote_ds/product_list_ds_impl.dart';
import '../../data/repositories/product_list_repo_impl.dart';
import '../../domain/repositories/product_list_repo.dart';
import '../../domain/use_cases/product_list_use_case.dart';

part 'products_page_state.dart';

class ProductsPageCubit extends Cubit<ProductsPageState> {
  ProductsPageCubit() : super(ProductsPageInitial());

  Future<void> getProducts() async {
    ApiManager apiManager = ApiManager();
    ProductRemoteDS productRemoteDS = ProductRemoteDSImpl(apiManager);
    ProductListRepo productListRepo = ProductListRepoImpl(productRemoteDS);
    ProductListUseCase productListUseCase = ProductListUseCase(productListRepo);
    var result = await productListUseCase.call();
    result.fold((l) {
      emit(ProductsPageError(error: l.message));
    }, (r) {
      emit(ProductsPageSuccess(productsModel: r));
    });
  }
}
