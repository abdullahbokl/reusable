import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home_cubit.dart';

class ProductsCount extends StatelessWidget {
  const ProductsCount({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<HomeCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'عدد العملاء: ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Text(
              "${clientsAcceptCubit.pageVariables.filteredList.length}",
              // "${clientsAcceptCubit.pageVariables.allClientsList.length}/${clientsAcceptCubit.pageVariables.totalClientsCount}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
