part of 'add_products_bloc.dart';

@freezed
class AddProductsState with _$AddProductsState {
  const factory AddProductsState.initial() = _Initial;
  const factory AddProductsState.loading() = _Loading;
  const factory AddProductsState.success() = _Success;
  const factory AddProductsState.error(String message) = _Error;
}
