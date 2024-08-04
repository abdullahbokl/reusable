import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/app_paginated_grid.dart';
import '../manager/home_cubit.dart';
import 'product_card_grid.dart';

class ProductsPaginatedGrid extends StatelessWidget {
  const ProductsPaginatedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AppPaginatedGridView(
          items: homeCubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return ProductCardGrid(
              product: homeCubit.pageVariables.filteredList[index],
            );
          },
          isLoading: state.getProductsStatus.isLoading(),
          onLoadMore: () => homeCubit.getProducts(isNewFilter: false),
          hasReachedMax: homeCubit.pageVariables.hasReachedMax,
        );
      },
    );
  }
}
