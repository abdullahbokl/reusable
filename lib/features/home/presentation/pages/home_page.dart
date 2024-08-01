import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable/core/helpers/bloc_status.dart';
import 'package:reusable/features/home/presentation/pages/animated_bloc_body_builder.dart';

import '../../../../core/common/widgets/app_error_widget.dart';
import '../../../../core/common/widgets/app_search_widget.dart';
import '../manager/home_cubit.dart';
import '../widgets/products_count.dart';
import '../widgets/products_paginated_list.dart';
import '../widgets/shimmer_products_list.dart';

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
      appBar: AppBar(
        title: const Text('Home').animate().fade().scale(),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: AppSearchWidget(
                  searchController: _homeCubit.pageVariables.searchController,
                  onChanged: (value) {
                    _homeCubit.filterProducts();
                  },
                ),
              ),
              // Flexible(
              //   child: AppFilterIcon<bool>(
              //     child: const FilterProductsSheet(),
              //     onResult: (result) {
              //       if (result != true) {
              //         _homeCubit.returnToPreviousState();
              //       }
              //     },
              //   ),
              // ),
            ],
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
                  _homeCubit.state.copyWith(
                    getProductsStatus: const BlocStatus.empty(),
                  );
                  return AnimatedBlocBodyBuilder(
                    child: state.getProductsStatus.when(
                      loading: () => const ShimmerProductsList(),
                      success: (data) => const ProductsPaginatedList(),
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
