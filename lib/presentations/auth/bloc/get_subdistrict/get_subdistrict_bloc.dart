import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_seller_apps/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/subdistrict_response_mode.dart';

part 'get_subdistrict_event.dart';
part 'get_subdistrict_state.dart';
part 'get_subdistrict_bloc.freezed.dart';

class GetSubdistrictBloc extends Bloc<GetSubdistrictEvent, GetSubdistrictState> {

  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  GetSubdistrictBloc(
    this.rajaongkirRemoteDatasource,
    ) : super(const _Initial()) {
      on<_GetSubdistrict>((event, emit) async {
      emit(const _Loading());
      final result = await rajaongkirRemoteDatasource.getSubdistrict(event.cityId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results!)));
    });
  }
}
