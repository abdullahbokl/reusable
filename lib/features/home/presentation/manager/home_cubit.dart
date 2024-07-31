import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reusable/core/helpers/bloc_status.dart';
import 'package:reusable/core/utils/app_constants.dart';

import '../../domain/entities/home_filter_entity.dart';
import '../../domain/entities/home_page_variables_entity.dart';
import '../../domain/use_cases/get_products_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetProductsUsecase _getProductsUsecase;

  HomeCubit(
    this._getProductsUsecase,
  ) : super(const HomeState());

  HomePageVariablesEntity pageVariables = HomePageVariablesEntity();
  HomeFilterEntity filterEntity = HomeFilterEntity();

  void init() {
    pageVariables = HomePageVariablesEntity();
    filterEntity = HomeFilterEntity();
  }

  Future<void> getProducts({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getProductsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedMax = false;
        }
        if (pageVariables.hasReachedMax) return;

        emit(state.copyWith(getProductsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getProductsUsecase(
          GetProductsParams(),
        );
        result.fold(
          (e) => emit(state.copyWith(
            getProductsStatus: BlocStatus.fail(error: e),
          )),
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalClientsCount = value.total ?? 0;
            pageVariables.hasReachedMax = value.data.isEmpty;
            filterProducts();
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getProductsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getProductsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_products',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterProducts() {
    emit(state.copyWith(
      filterProductsStatus: const BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = pageVariables.allList;
    } else {
      pageVariables.filteredList = pageVariables.allList.where(
        (element) {
          return element.searchString(pageVariables.searchController.text);
        },
      ).toList();
    }
    emit(state.copyWith(
      filterProductsStatus: const BlocStatus.success(),
    ));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
