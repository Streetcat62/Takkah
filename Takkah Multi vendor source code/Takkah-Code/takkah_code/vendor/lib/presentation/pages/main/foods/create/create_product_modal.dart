import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../component/components.dart';
import 'details/create_food_details_body.dart';
import '../../../../../application/providers.dart';


class CreateProductModal extends ConsumerStatefulWidget {
  const CreateProductModal({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateProductModal> createState() => _CreateProductModalState();
}

class _CreateProductModalState extends ConsumerState<CreateProductModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(createFoodDetailsProvider.notifier).updateAddFoodInfo(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ModalDrag(),
            CreateFoodDetailsBody(onSave: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
