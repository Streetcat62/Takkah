import '../data/meta.dart';
import '../data/order_detail.dart';

class OrderPaginateResponse {
  OrderPaginateResponse({List<OrderDetailData>? data, Meta? meta, int? ordersCount}) {
    _data = data;
    _meta = meta;
    _ordersCount = ordersCount;
  }

  OrderPaginateResponse.fromJson(dynamic json) {
    if (json['data']['orders'] != null) {
      _data = [];
      json['data']['orders'].forEach((v) {
        _data?.add(OrderDetailData.fromJson(v));
      });
    }
    _ordersCount = json['data']['statistic']['orders_count'];
    _meta = json['data']['meta'] != null ? Meta.fromJson(json['data']['meta']) : null;
  }

  List<OrderDetailData>? _data;
  Meta? _meta;
  int? _ordersCount;

  OrderPaginateResponse copyWith({List<OrderDetailData>? data, Meta? meta, int? ordersCount}) =>
      OrderPaginateResponse(data: data ?? _data, meta: meta ?? _meta, ordersCount: ordersCount ?? _ordersCount);

  List<OrderDetailData>? get data => _data;

  Meta? get meta => _meta;

  int? get orderCount => _ordersCount;

}

