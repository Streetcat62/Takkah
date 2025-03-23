
class StatisticsResponse {
    List<Chart>? chart;
    String? acceptedOrdersCount;
    String? deliveredOrdersCount;
    String? cancelOrdersCount;
    String? newOrdersCount;
    int? ordersCount;
    double? totalDeliveredPrice;
    double? totalDeliveryFee;
    double? orderTax;

    StatisticsResponse({
        this.chart,
        this.acceptedOrdersCount,
        this.deliveredOrdersCount,
        this.cancelOrdersCount,
        this.newOrdersCount,
        this.ordersCount,
        this.totalDeliveredPrice,
        this.totalDeliveryFee,
        this.orderTax,
    });

    StatisticsResponse copyWith({
        List<Chart>? chart,
        String? acceptedOrdersCount,
        String? deliveredOrdersCount,
        String? cancelOrdersCount,
        String? newOrdersCount,
        int? ordersCount,
        double? totalDeliveredPrice,
        double? totalDeliveryFee,
        double? orderTax,
    }) => 
        StatisticsResponse(
            chart: chart ?? this.chart,
            acceptedOrdersCount: acceptedOrdersCount ?? this.acceptedOrdersCount,
            deliveredOrdersCount: deliveredOrdersCount ?? this.deliveredOrdersCount,
            cancelOrdersCount: cancelOrdersCount ?? this.cancelOrdersCount,
            newOrdersCount: newOrdersCount ?? this.newOrdersCount,
            ordersCount: ordersCount ?? this.ordersCount,
            totalDeliveredPrice: totalDeliveredPrice ?? this.totalDeliveredPrice,
            totalDeliveryFee: totalDeliveryFee ?? this.totalDeliveryFee,
            orderTax: orderTax ?? this.orderTax,
        );

    factory StatisticsResponse.fromJson(Map<String, dynamic> json) => StatisticsResponse(
        chart: json["chart"] == null ? [] : List<Chart>.from(json["chart"]!.map((x) => Chart.fromJson(x))),
        acceptedOrdersCount: json["accepted_orders_count"],
        deliveredOrdersCount: json["delivered_orders_count"],
        cancelOrdersCount: json["cancel_orders_count"],
        newOrdersCount: json["new_orders_count"],
        ordersCount: json["orders_count"],
        totalDeliveredPrice: json["total_delivered_price"]?.toDouble(),
        totalDeliveryFee: json["total_delivery_fee"]?.toDouble(),
        orderTax: json["order_tax"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "chart": chart == null ? [] : List<dynamic>.from(chart!.map((x) => x.toJson())),
        "accepted_orders_count": acceptedOrdersCount,
        "delivered_orders_count": deliveredOrdersCount,
        "cancel_orders_count": cancelOrdersCount,
        "new_orders_count": newOrdersCount,
        "orders_count": ordersCount,
        "total_delivered_price": totalDeliveredPrice,
        "total_delivery_fee": totalDeliveryFee,
        "order_tax": orderTax,
    };
}

class Chart {
    DateTime? time;
    double? price;

    Chart({
        this.time,
        this.price,
    });

    Chart copyWith({
        DateTime? time,
        double? price,
    }) => 
        Chart(
            time: time ?? this.time,
            price: price ?? this.price,
        );

    factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "time": "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}",
        "price": price,
    };
}
