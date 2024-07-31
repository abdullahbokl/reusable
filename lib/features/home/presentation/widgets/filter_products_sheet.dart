import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_navigator.dart';
import '../manager/home_cubit.dart';

class FilterProductsSheet extends StatefulWidget {
  const FilterProductsSheet({super.key});

  @override
  State<FilterProductsSheet> createState() => _FilterProductsSheetState();
}

class _FilterProductsSheetState extends State<FilterProductsSheet> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _homeCubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return TextButton(
                    onPressed: _homeCubit.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _homeCubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    child: const Text("Reset"),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _filterAndCloseDialog(),
              child: const Text("Filter"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _homeCubit.getProducts();
    AppNavigator.pop(result: true);
  }
}
