part of 'add_products_bloc.dart';

@freezed
class AddProductsEvent with _$AddProductsEvent {
  const factory AddProductsEvent.started() = _Started;
  const factory AddProductsEvent.addProducts(ProductRequestModel data) = _AddProducts;
}