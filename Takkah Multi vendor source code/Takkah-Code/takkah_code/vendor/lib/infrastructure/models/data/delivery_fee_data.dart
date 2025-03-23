
class DeliveryFeeResponse {
    bool? status;
    String? message;
    DeliveryFee? data;

    DeliveryFeeResponse({
        this.status,
        this.message,
        this.data,
    });

    DeliveryFeeResponse copyWith({
        bool? status,
        String? message,
        DeliveryFee? data,
    }) => 
        DeliveryFeeResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory DeliveryFeeResponse.fromJson(Map<String, dynamic> json) => DeliveryFeeResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : DeliveryFee.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class DeliveryFee {
    num? deliveryFee;

    DeliveryFee({
        this.deliveryFee,
    });

    DeliveryFee copyWith({
        num? deliveryFee,
    }) => 
        DeliveryFee(
            deliveryFee: deliveryFee ?? this.deliveryFee,
        );

    factory DeliveryFee.fromJson(Map<String, dynamic> json) => DeliveryFee(
        deliveryFee: json["delivery_fee"],
    );

    Map<String, dynamic> toJson() => {
        "delivery_fee": deliveryFee,
    };
}
