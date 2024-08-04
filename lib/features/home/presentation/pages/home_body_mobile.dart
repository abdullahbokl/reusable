import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/app_error_widget.dart';
import '../../../../core/common/widgets/app_filter_icon.dart';
import '../../../../core/common/widgets/app_search_widget.dart';
import '../manager/home_cubit.dart';
import '../widgets/filter_products_sheet.dart';
import '../widgets/products_count.dart';
import '../widgets/products_paginated_list.dart';
import '../widgets/shimmer_products_list.dart';
import 'animated_bloc_body_builder.dart';

class HomeBodyMobile extends StatelessWidget {
  const HomeBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Flexible(
                child: AppSearchWidget(
                  searchController: homeCubit.pageVariables.searchController,
                  onChanged: (value) {
                    homeCubit.filterProducts();
                  },
                ),
              ),
              const SizedBox(width: 8),
              AppFilterIcon<bool>(
                child: const FilterProductsSheet(),
                onResult: (result) {
                  if (result != true) {
                    homeCubit.returnToPreviousState();
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ProductsCount(),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) {
                return previous.getProductsStatus !=
                        current.getProductsStatus &&
                    homeCubit.pageVariables.isNewFilter;
              },
              builder: (context, state) {
                return AnimatedBlocBodyBuilder(
                  child: state.getProductsStatus.when(
                    loading: () => const ShimmerProductsList(),
                    success: (data) => const ProductsPaginatedList(),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => homeCubit.getProducts(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
