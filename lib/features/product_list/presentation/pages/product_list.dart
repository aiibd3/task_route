import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_route/core/utils/styles.dart';
import 'package:task_route/features/product_list/presentation/cubit/products_page_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

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
          backgroundColor: AppColor.primary,
          title: _isSearching
              ? TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
            onChanged: (query) {
              // Implement your search logic here
            },
          )
              : Text(
            "Product Details",
            style: AppStyles.poppins20.copyWith(
              color: Colors.white,
            ),
          ),
          actions: [
            if (!_isSearching)
              IconButton(
                onPressed: () {
                  setState(() {
                    _isSearching = true;
                  });
                },
                icon: const Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            if (_isSearching)
              IconButton(
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchController.clear();
                  });
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProductsPageCubit, ProductsPageState>(
          builder: (context, state) {
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
                    mainAxisSpacing: 5.h,
                    crossAxisSpacing: 10.w),
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
