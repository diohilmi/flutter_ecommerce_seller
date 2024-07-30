import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_seller_apps/core/constants/variables.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/province_response_model.dart';
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
      return const Left("error");
    }

  }
  
}