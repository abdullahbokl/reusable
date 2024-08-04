import 'package:flutter/material.dart';
import 'package:reusable/core/utils/app_dimensions.dart';
import 'package:reusable/core/utils/app_navigator.dart';

import '../../../../core/common/widgets/app_cached_image.dart';
import '../../../../core/common/widgets/app_text.dart';
import '../../domain/entities/product_entity.dart';

class ProductCardList extends StatelessWidget {
  const ProductCardList({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(const Scaffold()),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppCachedImage(
                    imageUrl: product.thumbnail ?? '',
                    width: AppDimensions.scaleImageSize(100),
                    height: AppDimensions.scaleImageSize(100),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(product.title),
                    AppText(product.price.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
