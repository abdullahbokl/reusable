import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../manager/home_cubit.dart';
import 'product_card_list.dart';

class ProductsPaginatedList extends StatelessWidget {
  const ProductsPaginatedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: homeCubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return ProductCardList(
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
