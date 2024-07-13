import 'package:flutter/cupertino.dart';
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
  final bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsPageCubit()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 24,
          ),
          backgroundColor: Colors.white,
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search ...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onChanged: (query) {
                    // Implement your search logic here
                  },
                )
              : Text(
                  "Route",
                  style: AppStyles.poppins20.copyWith(
                    color: AppColor.primary,
                  ),
                ),
          actions: const [
            // if (!_isSearching)
            //   IconButton(
            //     onPressed: () {
            //       setState(() {
            //         _isSearching = true;
            //       });
            //     },
            //     icon: const Icon(
            //       Icons.search,
            //       size: 24,
            //       color: Colors.white,
            //     ),
            //   ),
            // if (_isSearching)
            //   IconButton(
            //     onPressed: () {
            //       setState(() {
            //         _isSearching = false;
            //         _searchController.clear();
            //       });
            //     },
            //     icon: const Icon(
            //       Icons.close,
            //       size: 24,
            //       color: Colors.white,
            //     ),
            //   ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
              child: SizedBox(
                height: 55.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What Do You Search For ?',
                          prefixIcon:
                              const Icon(Icons.search, color: AppColor.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: AppColor.primary, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: AppColor.primary, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: AppColor.primary, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: AppColor.primary),
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductsPageCubit, ProductsPageState>(
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
          ],
        ),
      ),
    );
  }
}
