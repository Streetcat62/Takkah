import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';



part 'order_cart_state.freezed.dart';

@freezed
class OrderCartState with _$OrderCartState {
  const factory OrderCartState({
    @Default([]) List<ProductModel> products,
    @Default(0) num totalPrice,
    @Default(0) num cartCount,
  }) = _OrderCartState;

  const OrderCartState._();
}
