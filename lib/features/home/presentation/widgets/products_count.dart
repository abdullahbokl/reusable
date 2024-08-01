import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home_cubit.dart';

class ProductsCount extends StatelessWidget {
  const ProductsCount({super.key});

  @override
  Widget build(BuildContext context) {
    final productsCubit = context.read<HomeCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Products',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Text(
              "${productsCubit.pageVariables.allList.length}/${productsCubit.pageVariables.totalClientsCount}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            );
          },
        ),
      ],
    );
  }
}
