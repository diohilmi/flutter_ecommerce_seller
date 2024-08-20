// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_seller_apps/data/datasources/product_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_seller_apps/data/models/response/products_response_model.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/request/product_request_model.dart';

part 'add_products_bloc.freezed.dart';
part 'add_products_event.dart';
part 'add_products_state.dart';

class AddProductsBloc extends Bloc<AddProductsEvent, AddProductsState> {
  final ProductRemoteDatasource productRemoteDatasource;
  AddProductsBloc(
    this.productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_AddProducts>((event, emit) async {
      emit(const _Loading());

      final result = await productRemoteDatasource.addProduct(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
