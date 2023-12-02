import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_route/core/utils/styles.dart';
import 'package:task_route/features/product_list/presentation/cubit/products_page_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/product_list_bloc.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsPageCubit()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: AppColor.primary,
            size: 24,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            "Product Details",
            style: AppStyles.poppins20.copyWith(
              color: AppColor.primary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 24,
                color: AppColor.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart,
                size: 24,
                color: AppColor.primary,
              ),
            ),
          ],
        ),

        body: BlocBuilder<ProductsPageCubit, ProductsPageState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<ProductsPageCubit>(context);
            if (state is ProductsPageInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductsPageError) {
              return Center(
                child: Text(state.error),
              );
            }

            if (state is ProductsPageSuccess) {
              return GridView.builder(
                itemCount: state.productsModel.limit as int?,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (192 / 237),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w),
                itemBuilder: (context, index) {
                  return ProductItem(
                      product: state.productsModel.products![index],
                      index: index);
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
