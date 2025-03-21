class StatisticsResponse {
  StatisticsResponse({this.data});

  StatisticsResponse.fromJson(dynamic json) {
    data = json['data'] != null ? StatisticsData.fromJson(json['data']) : null;
  }

  StatisticsData? data;

  StatisticsResponse copyWith({StatisticsData? data}) =>
      StatisticsResponse(data: data ?? this.data);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class StatisticsData {
  StatisticsData({
    this.progressOrdersCount,
    this.deliveredOrdersCount,
    this.cancelOrdersCount,
    this.newOrdersCount,
    this.acceptedOrdersCount,
    this.readyOrdersCount,
    this.onAWayOrdersCount,
    this.ordersCount,
    this.totalPrice,
  });

  StatisticsData.fromJson(dynamic json) {
    progressOrdersCount = json['progress_orders_count'];
    deliveredOrdersCount = json['delivered_orders_count'];
    cancelOrdersCount = json['cancel_orders_count'];
    newOrdersCount = json['new_orders_count'];
    acceptedOrdersCount = json['accepted_orders_count'];
    readyOrdersCount = json['ready_orders_count'];
    onAWayOrdersCount = json['on_a_way_orders_count'];
    ordersCount = json['orders_count'];
    totalPrice = json['total_price'];
  }

  num? progressOrdersCount;
  num? deliveredOrdersCount;
  num? cancelOrdersCount;
  num? newOrdersCount;
  num? acceptedOrdersCount;
  num? readyOrdersCount;
  num? onAWayOrdersCount;
  num? ordersCount;
  num? totalPrice;

  StatisticsData copyWith({
    num? progressOrdersCount,
    num? deliveredOrdersCount,
    num? cancelOrdersCount,
    num? newOrdersCount,
    num? acceptedOrdersCount,
    num? readyOrdersCount,
    num? onAWayOrdersCount,
    num? ordersCount,
    num? totalPrice,
  }) =>
      StatisticsData(
        progressOrdersCount: progressOrdersCount ?? this.progressOrdersCount,
        deliveredOrdersCount: deliveredOrdersCount ?? this.deliveredOrdersCount,
        cancelOrdersCount: cancelOrdersCount ?? this.cancelOrdersCount,
        newOrdersCount: newOrdersCount ?? this.newOrdersCount,
        acceptedOrdersCount: acceptedOrdersCount ?? this.acceptedOrdersCount,
        readyOrdersCount: readyOrdersCount ?? this.readyOrdersCount,
        onAWayOrdersCount: onAWayOrdersCount ?? this.onAWayOrdersCount,
        ordersCount: ordersCount ?? this.ordersCount,
        totalPrice: totalPrice ?? this.totalPrice,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['progress_orders_count'] = progressOrdersCount;
    map['delivered_orders_count'] = deliveredOrdersCount;
    map['cancel_orders_count'] = cancelOrdersCount;
    map['new_orders_count'] = newOrdersCount;
    map['accepted_orders_count'] = acceptedOrdersCount;
    map['ready_orders_count'] = readyOrdersCount;
    map['on_a_way_orders_count'] = onAWayOrdersCount;
    map['orders_count'] = ordersCount;
    map['total_price'] = totalPrice;
    return map;
  }
}
