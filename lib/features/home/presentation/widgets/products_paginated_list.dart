import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/home_cubit.dart';

class ProductsPaginatedList extends StatelessWidget {
  const ProductsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: clientsAcceptCubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return const SizedBox();
          },
        );
      },
    );
  }
}
