import '../data/translation.dart';

class PaymentsResponse {
  PaymentsResponse({List<PaymentData>? data}) {
    _data = data;
  }

  PaymentsResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PaymentData.fromJson(v));
      });
    }
  }

  List<PaymentData>? _data;

  PaymentsResponse copyWith({List<PaymentData>? data}) =>
      PaymentsResponse(data: data ?? _data);

  List<PaymentData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class PaymentData {
  PaymentData({
    int? id,
    int? shopId,
    int? status,
    String? clientId,
    String? secretId,
    Payment? payment,
  }) {
    _id = id;
    _shopId = shopId;
    _status = status;
    _clientId = clientId;
    _secretId = secretId;
    _payment = payment;
  }

  PaymentData.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _status = json['status'];
    _clientId = json['client_id'];
    _secretId = json['secret_id'];
    _payment =
    json['payment'] != null ? Payment.fromJson(json['payment']) : null;
  }

  int? _id;
  int? _shopId;
  int? _status;
  String? _clientId;
  String? _secretId;
  Payment? _payment;

  PaymentData copyWith({
    int? id,
    int? shopId,
    int? status,
    String? clientId,
    String? secretId,
    Payment? payment,
  }) =>
      PaymentData(
        id: id ?? _id,
        shopId: shopId ?? _shopId,
        status: status ?? _status,
        clientId: clientId ?? _clientId,
        secretId: secretId ?? _secretId,
        payment: payment ?? _payment,
      );

  int? get id => _id;

  int? get shopId => _shopId;

  int? get status => _status;

  String? get clientId => _clientId;

  String? get secretId => _secretId;

  Payment? get payment => _payment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['status'] = _status;
    map['client_id'] = _clientId;
    map['secret_id'] = _secretId;
    if (_payment != null) {
      map['payment'] = _payment?.toJson();
    }
    return map;
  }
}

class Payment {
  Payment({
    int? id,
    String? tag,
    int? input,
    bool? active,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) {
    _id = id;
    _tag = tag;
    _input = input;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
  }

  Payment.fromJson(dynamic json) {
    _id = json['id'];
    _tag = json['tag'];
    _input = json['input'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _tag;
  int? _input;
  bool? _active;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;

  Payment copyWith({
    int? id,
    String? tag,
    int? input,
    bool? active,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) =>
      Payment(
        id: id ?? _id,
        tag: tag ?? _tag,
        input: input ?? _input,
        active: active ?? _active,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get tag => _tag;

  int? get input => _input;

  bool? get active => _active;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tag'] = _tag;
    map['input'] = _input;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}
