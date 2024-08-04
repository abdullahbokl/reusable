part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BlocStatus getProductsStatus;
  final BlocStatus getCategoriesStatus;

  const HomeState({
    this.getProductsStatus = const BlocStatus.initial(),
    this.getCategoriesStatus = const BlocStatus.initial(),
  });

  HomeState copyWith({
    BlocStatus? getProductsStatus,
    BlocStatus? getCategoriesStatus,
  }) {
    return HomeState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getProductsStatus,
      getCategoriesStatus,
    ];
  }
}
