import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_seller_apps/core/constants/variables.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/city_response_model.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/province_response_model.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/subdistrict_response_mode.dart';
import 'package:http/http.dart' as http;

class RajaongkirRemoteDatasource {

  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    final url = Uri.parse('${Variables.baseUrlRajaOngkir}/api/province?key=${Variables.rajaOngkirKey}');
    final response = await http.get(
      url, 
      headers: {
        'Content-Type': 'application/json',

    });

    if (response.statusCode == 200) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return const Left("error get province");
    }
  }

  Future<Either<String, CityResponseModel>> getCity(int provinceId) async {
    final url = Uri.parse('${Variables.baseUrlRajaOngkir}/api/city?key=${Variables.rajaOngkirKey}&province=$provinceId');
    final response = await http.get(
      url, 
      headers: {
        'Content-Type': 'application/json',

    });

    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left("error get province");
    }
  }


  Future<Either<String, SubdistrictResponseModel>> getSubdistrict(int cityId) async {
    final url = Uri.parse('${Variables.baseUrlRajaOngkir}/api/subdistrict?key=${Variables.rajaOngkirKey}&city=$cityId');
    final response = await http.get(
      url, 
      headers: {
        'Content-Type': 'application/json',

    });

    if (response.statusCode == 200) {
      return Right(SubdistrictResponseModel.fromJson(response.body));
    } else {
      return const Left("error get city");
    }
  }

  
  
}