import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_seller_apps/core/constants/variables.dart';
import 'package:flutter_ecommerce_seller_apps/data/models/response/products_response_model.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/home/models/product_model.dart';

import '../../../core/assets/assets.dart';
import '../../../core/core.dart';
// import '../../customer/dialogs/delete_product_dialog.dart';
// import '../pages/edit_product_page.dart';

class ProductCard extends StatelessWidget {
  final Product item;

  const ProductCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl:  '${Variables.imageUrl}/storage/${item.image}',
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SpaceWidth(16.0),
                Text(
                  item.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            Row(
              children: [
                const SpaceWidth(16.0),
                Text(
                  item.price!.currencyFormatRp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {}, //=> context.push(EditProductPage(item: item)),
                  icon: Assets.icons.edit.svg(),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SizedBox();
                      }, //=> const DeleteProductDialog(),
                    );
                  },
                  icon: Assets.icons.delete.svg(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
