import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import 'details/edit_food_details_body.dart';
import '../../../../component/components.dart';

class EditProductModal extends StatefulWidget {
  final ProductModel product;

  const EditProductModal({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProductModal> createState() => _EditProductModalState();
}

class _EditProductModalState extends State<EditProductModal> {
  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ModalDrag(),
            EditFoodDetailsBody(onSave: () => context.popRoute()),
          ],
        ),
      ),
    );
  }
}
