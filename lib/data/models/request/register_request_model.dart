import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class RegisterRequestModel {
  // 'name': 'Toko Baru',
  // 'email': 'emailbaru@seller.com',
  // 'password': '12345678',
  // 'phone': '081123123123',
  // 'country': 'Indonesia',
  // 'address': 'RT0 RW01',
  // 'province': 'Jawa Timur',
  // 'city': 'Tulungagung',
  // 'district': 'Betak',
  // 'postal_code': '66281'

  final String name;
  final String email;
  final String password;
  final String phone;
  final String country;
  final String address;
  final String province;
  final String city;
  final String district;
  final String postalCode;
  final XFile image;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.country,
    required this.address,
    required this.province,
    required this.city,
    required this.district,
    required this.postalCode,
    required this.image,
  });

  Map<String, String> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "country": country,
      "address": address,
      "province": province,
      "city": city,
      "district": district,
      "postal_code": postalCode,
    };
  }
}
