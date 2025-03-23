import 'package:freezed_annotation/freezed_annotation.dart';
import '../../infrastructure/models/data/product_model.dart';


part 'order_products_state.freezed.dart';

@freezed
class OrderProductsState with _$OrderProductsState {
  const factory OrderProductsState({
     @Default('') String query,
    @Default(false) bool isLoading,
    @Default([]) List<ProductModel> products,
  }) = _OrderProductsState;

  const OrderProductsState._();
}
