import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/request/register_request_model.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';

class AuthRemoteDatasource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel data) async {
    
    /// ### Localhost and Emulator/Device Differences:
    /// - When using an Android emulator, 127.0.0.1 refers to the emulator itself, not your host machine.
    ///   Use 10.0.2.2 instead of 127.0.0.1 to refer to your host machine's localhost.
    /// - When using an iOS simulator, 127.0.0.1 should work as it maps to the host machine's localhost.
    
    //url
    String cekPhoneUrl;
    if (defaultTargetPlatform == TargetPlatform.android) {
      cekPhoneUrl = 'http://10.0.2.2:8000/api/register/seller';
    } else {
      cekPhoneUrl = '${Variables.baseUrl}/api/register/seller';
    }

    final url = Uri.parse(cekPhoneUrl);

    //request post image
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.MultipartRequest('POST', url);
    request.files
        .add(await http.MultipartFile.fromPath('photo', data.image.path));
    request.fields.addAll(data.toMap());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(
          await response.stream.bytesToString()));
    } else {
      return const Left("error register");
    }
  }
}
