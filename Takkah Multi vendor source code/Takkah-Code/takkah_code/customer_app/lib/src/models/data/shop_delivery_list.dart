import '../models.dart';

class ShopDeliveryList {
  ShopDeliveryList({
    List<ShopDelivery>? deliveries,
}) {
    _deliveries = deliveries;
  }

  ShopDeliveryList.fromJson(dynamic json) {
    if (json['data'] != null) {
      _deliveries = [];
      json['data'].forEach((v) {
        _deliveries?.add(ShopDelivery.fromJson(v));
      });
    }
  }

  List<ShopDelivery>? _deliveries;

  ShopDeliveryList copyWith ({
    List<ShopDelivery>? deliveries,
}) =>
      ShopDeliveryList(
        deliveries: deliveries ?? _deliveries,
      );
  List<ShopDelivery>? get deliveries => _deliveries;
}