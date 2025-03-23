import '../data/product_data.dart';

class ProductsPaginateResponse {
  ProductsPaginateResponse({List<ProductData>? data}) {
    _data = data;
  }

  ProductsPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductData.fromJson(v));
      });
    }
  }

  List<ProductData>? _data;

  ProductsPaginateResponse copyWith({List<ProductData>? data}) =>
      ProductsPaginateResponse(data: data ?? _data);

  List<ProductData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
