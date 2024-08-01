part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BlocStatus<bool> getProductsStatus;

  const HomeState({
    this.getProductsStatus = const BlocStatus<bool>.initial(),
  });

  HomeState copyWith({
    BlocStatus<bool>? getProductsStatus,
  }) {
    return HomeState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
    );
  }

  @override
  List<Object> get props {
    return [getProductsStatus];
  }
}
