import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_route/features/product_list/data/models/product.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final Product product;

  const ProductItem({required this.index, required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: index.isEven ? 8.w : 0, right: index.isOdd ? 8.w : 0, top: 8.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 2.w, color: Colors.blueGrey)),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.thumbnail ?? "",
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: 150.h,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline, size: 30),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(2.h.w),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.r),
                          // border:
                          //     Border.all(width: 2.w, color: Colors.blueGrey),
                        ),
                        child: const Icon(
                          Icons.favorite_outline,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, bottom: 8.h, right: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                          fontSize: 14.sp),
                    ),
                    Text(
                      product.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                          fontSize: 14.sp),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          "EGP ${product.price.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary,
                              fontSize: 14.sp),
                        ),
                        const Spacer(),
                        Text(
                          "EGP ${((product.price! * (1 + product.discountPercentage! / 100))).toStringAsFixed(2)}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppColor.font,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          "Review",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary,
                              fontSize: 14.sp),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "(${product.rating})",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary,
                              fontSize: 14.sp),
                        ),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(5.w.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: AppColor.primary,
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
