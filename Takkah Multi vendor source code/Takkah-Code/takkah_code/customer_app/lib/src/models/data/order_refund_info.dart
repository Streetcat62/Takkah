


class OrderRefundData {
  OrderRefundData({
    required this.data,
  });

  Data data;

  factory OrderRefundData.fromJson(Map<String, dynamic> json) => OrderRefundData(
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  Data({
    required this.messageSeller,
    required this.messageUser,
    required this.status,
    required this.id,
    required this.price
  });

  String messageSeller;
  String messageUser;
  String status;
  int id;
  num price;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    messageSeller: json["message_seller"] ?? "",
    messageUser: json["message_user"] ?? "",
    status: json["status"],
    id: json["id"],
    price: json['order']['price'] ?? 0
  );
}
