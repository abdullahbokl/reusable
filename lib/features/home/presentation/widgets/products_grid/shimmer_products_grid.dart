import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/common/widgets/app_paginated_grid.dart';

class ShimmerProductsGrid extends StatelessWidget {
  const ShimmerProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        transform: const GradientRotation(0.3),
        colors: [
          Colors.grey[300]!,
          Colors.grey[100]!,
          Colors.grey[300]!,
        ],
        stops: const [0.4, 0.5, 0.6],
      ),
      child: AppPaginatedGridView(
        items: List.generate(50, (index) => index),
        itemBuilder: (context, index) {
          return const Card(child: SizedBox(height: 180));
        },
      ),
    );
  }
}
