import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_seller_apps/core/constants/variables.dart';
import 'package:flutter_ecommerce_seller_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/response/add_product_response_model.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/response/products_response_model.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/request/product_request_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  String getBaseUrl(String endpoint) {
    return (defaultTargetPlatform == TargetPlatform.android)
        ? 'http://10.0.2.2:8000/api/$endpoint'
        : '${Variables.baseUrl}/api/$endpoint';
  }

  Future<Either<String, dynamic>> getProducts() async {
    // final url = Uri.parse('${Variables.baseUrl}/api/products/seller');

    final url = Uri.parse(getBaseUrl('products/seller'));

    final authData = await AuthLocalDatasource().getAuthData();
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${authData?.data!.token}', // coba cek bagian ? dan !
    };

    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left("error get products");
    }
  }


  Future<Either<String, AddProductsResponseModel>> addProduct(ProductRequestModel data) async {
    final url = Uri.parse(getBaseUrl('products/seller'));
    final authData = await AuthLocalDatasource().getAuthData();
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${authData?.data!.token}', // coba cek bagian ? dan !
    };
    final response = http.MultipartRequest(
      'POST',
      url,
    );

    response.files
        .add(await http.MultipartFile.fromPath('photo', data.image.path));

    response.fields.addAll(data.toMap());

    response.headers.addAll(header);
    var result = await response.send();

    if (result.statusCode == 201) {
      return Right(AddProductsResponseModel.fromJson( await result.stream.bytesToString()));
    } else {
      return const Left("error add product");
    }
  }
}
