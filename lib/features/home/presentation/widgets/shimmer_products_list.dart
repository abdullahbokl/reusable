import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common/widgets/app_paginated_list.dart';

class ShimmerProductsList extends StatelessWidget {
  const ShimmerProductsList({super.key});

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
      child: AppPaginatedList(
        items: List.generate(10, (index) => index),
        itemBuilder: (context, index) {
          return const Card(child: SizedBox(height: 90));
        },
      ),
    );
  }
}
