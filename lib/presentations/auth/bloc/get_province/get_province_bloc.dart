import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_seller_apps/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/province_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_province_bloc.freezed.dart';
part 'get_province_event.dart';
part 'get_province_state.dart';

class GetProvinceBloc extends Bloc<GetProvinceEvent, GetProvinceState> {
  final RajaongkirRemoteDatasource _rajaongkirRemoteDatasource;
  GetProvinceBloc(this._rajaongkirRemoteDatasource) : super(const _Initial()) {
    on<_GetProvince>((event, emit) async {
      emit(const _Loading());
      final result =
          await _rajaongkirRemoteDatasource.getProvince();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results!)),
      );
    });
  }
}
