import '../data/coupon_data.dart';

class CouponResponse {
  CouponResponse({CouponData? data}) {
    _data = data;
  }

  CouponResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? CouponData.fromJson(json['data']) : null;
  }

  CouponData? _data;

  CouponResponse copyWith({CouponData? data}) =>
      CouponResponse(data: data ?? _data);

  CouponData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
