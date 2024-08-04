import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/app_error_widget.dart';
import '../../../../core/common/widgets/app_filter_icon.dart';
import '../../../../core/common/widgets/app_search_widget.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/utils/size_config.dart';
import '../manager/home_cubit.dart';
import '../widgets/filter_products_sheet.dart';
import '../widgets/products_count.dart';
import '../widgets/products_paginated_grid.dart';
import '../widgets/products_paginated_list.dart';
import '../widgets/shimmer_products_list.dart';
import 'animated_bloc_body_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _SupportClientAcceptState();
}

class _SupportClientAcceptState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _homeCubit.getProducts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !SizeConfig.isDesktop(context)
          ? AppBar(title: const Text('Home').animate().fade().scale())
          : null,
      body: Column(
        children: [
          if (SizeConfig.isDesktop(context)) ...[
            const SizedBox(height: 15),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Flexible(
                  child: AppSearchWidget(
                    searchController: _homeCubit.pageVariables.searchController,
                    onChanged: (value) {
                      _homeCubit.filterProducts();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                AppFilterIcon<bool>(
                  child: const FilterProductsSheet(),
                  onResult: (result) {
                    if (result != true) {
                      _homeCubit.returnToPreviousState();
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
                      _homeCubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return AnimatedBlocBodyBuilder(
                    child: state.getProductsStatus.when(
                      loading: () => const ShimmerProductsList(),
                      success: (data) {
                        if (AppDimensions.currentWidth() >= 600) {
                          return const ProductsPaginatedGrid();
                        }
                        return const ProductsPaginatedList();
                      },
                      failure: (error, data) => AppErrorWidget(
                        message: error,
                        onPressed: () => _homeCubit.getProducts(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
