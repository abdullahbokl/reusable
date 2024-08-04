import 'package:flutter/material.dart';
import 'package:reusable/core/utils/app_dimensions.dart';
import 'package:reusable/core/utils/app_navigator.dart';

import '../../../../core/common/widgets/app_cached_image.dart';
import '../../../../core/common/widgets/app_text.dart';
import '../../domain/entities/product_entity.dart';

class ProductCardGrid extends StatelessWidget {
  const ProductCardGrid({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(const Scaffold()),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppCachedImage(
                  imageUrl: product.thumbnail ?? '',
                  width: AppDimensions.scaleImageSize(100),
                  height: AppDimensions.scaleImageSize(100),
                ),
              ),
              const SizedBox(height: 10),
              AppText(product.title),
              AppText(product.price.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
