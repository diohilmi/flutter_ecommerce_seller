import 'package:flutter/material.dart';

import '../../../core/core.dart';
// import '../../core/core.dart';
// import 'register_verify_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final dummy = ['Dummy 1', 'Dummy 2', 'Dummy 3'];
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final ValueNotifier countryNotifier;
  late final ValueNotifier provinceNotifier;
  late final ValueNotifier cityNotifier;
  late final ValueNotifier subdistrictNotifier;
  late final TextEditingController addressController;
  late final TextEditingController zipCodeController;
  late final TextEditingController phoneNumberController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    countryNotifier = ValueNotifier(dummy.first);
    provinceNotifier = ValueNotifier(dummy.first);
    cityNotifier = ValueNotifier(dummy.first);
    subdistrictNotifier = ValueNotifier(dummy.first);
    addressController = TextEditingController();
    zipCodeController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    countryNotifier.dispose();
    provinceNotifier.dispose();
    cityNotifier.dispose();
    subdistrictNotifier.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(18.0),
          const Center(
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: nameController,
            label: 'Nama Toko',
            hintText: 'Masukkan nama toko',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: emailController,
            label: 'E-mail',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            helperText: 'must contain 8 char.',
            obscureText: true,
            hintText: '*********',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(12.0),
          ValueListenableBuilder(
            valueListenable: countryNotifier,
            builder: (context, value, _) => CustomDropdown(
              value: value,
              items: dummy,
              label: 'Negara / Wilayah',
              onChanged: (value) => countryNotifier.value = value ?? '',
            ),
          ),
          const SpaceHeight(12.0),
          ValueListenableBuilder(
            valueListenable: provinceNotifier,
            builder: (context, value, _) => CustomDropdown(
              value: value,
              items: dummy,
              label: 'Propinsi',
              onChanged: (value) => countryNotifier.value = value ?? '',
            ),
          ),
          const SpaceHeight(12.0),
          ValueListenableBuilder(
            valueListenable: cityNotifier,
            builder: (context, value, _) => CustomDropdown(
              value: value,
              items: dummy,
              label: 'Kota',
              onChanged: (value) => countryNotifier.value = value ?? '',
            ),
          ),
          const SpaceHeight(12.0),
          ValueListenableBuilder(
            valueListenable: subdistrictNotifier,
            builder: (context, value, _) => CustomDropdown(
              value: value,
              items: dummy,
              label: 'Kecamatan',
              onChanged: (value) => countryNotifier.value = value ?? '',
            ),
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: addressController,
            label: 'Alamat',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: zipCodeController,
            label: 'Kode Pos',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText: 'Masukkan kode POS',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'No Handphone',
            keyboardType: TextInputType.number,
            hintText: 'Masukkan nomor handphone',
          ),
          const SpaceHeight(12.0),
          CustomImagePicker(
            label: 'Foto Toko',
            onChanged: (imagePath) {},
          ),
          const SpaceHeight(38.0),
          Button.filled(
            onPressed: () {
              // context.push(const RegisterVerifyPage());
            },
            label: 'Create Account',
            borderRadius: 99.0,
          ),
          const SpaceHeight(16.0),
          InkWell(
            onTap: () => context.pop(),
            child: const SizedBox(
              height: 50.0,
              child: Center(
                child: Text('already have an account? please login'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
