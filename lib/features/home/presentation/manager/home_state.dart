part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BlocStatus<bool> getProductsStatus;
  final BlocStatus filterProductsStatus;

  const HomeState({
    this.getProductsStatus = const BlocStatus<bool>.initial(),
    this.filterProductsStatus = const BlocStatus<bool>.initial(),
  });

  HomeState copyWith({
    BlocStatus<bool>? getProductsStatus,
    BlocStatus? filterProductsStatus,
  }) {
    return HomeState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      filterProductsStatus: filterProductsStatus ?? this.filterProductsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getProductsStatus,
      filterProductsStatus,
    ];
  }
}
