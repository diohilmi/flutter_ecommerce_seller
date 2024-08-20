import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/request/product_request_model.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/home/bloc/add_products/add_products_bloc.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/home/bloc/get_products/get_products_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/components/components.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  // final imageController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();
  XFile? image;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    // imageController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CustomTextField(
            controller: nameController,
            label: 'Nama Product',
            hintText: 'Masukkan nama product',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(8.0),
          CustomTextField(
            controller: descriptionController,
            label: 'Deskripsi',
            hintText: 'Masukkan Deskripsi',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(8.0),
          CustomImagePicker(
            label: 'Gambar',
            onChanged: (imagePath) {
              if (imagePath != null) {
                image = imagePath;
              }
            },
          ),
          const SpaceHeight(8.0),
          CustomTextField(
            controller: priceController,
            label: 'Harga',
            hintText: 'Masukkan Harga',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(8.0),
          CustomTextField(
            controller: stockController,
            label: 'Total Stok',
            hintText: 'Masukkan jumlah ketersediaan',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AddProductsBloc, AddProductsState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: () {
                context.read<GetProductsBloc>().add(
                      const GetProductsEvent.getProducts(),
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product berhasil ditambahkan'),
                  ),
                );
                Navigator.pop(context);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Button.filled(
                  onPressed: () {
                    final data = ProductRequestModel(
                      name: nameController.text,
                      description: descriptionController.text,
                      price: int.parse(priceController.text),
                      stock: int.parse(stockController.text),
                      image: image!,
                      categoryId: 1,
                    );
                    context
                        .read<AddProductsBloc>()
                        .add(AddProductsEvent.addProducts(data));
                  },
                  label: 'Tambah',
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (message) => Button.filled(
                onPressed: () {},
                label: message,
              ),
            );
          },
        ),
      ),
    );
  }
}
