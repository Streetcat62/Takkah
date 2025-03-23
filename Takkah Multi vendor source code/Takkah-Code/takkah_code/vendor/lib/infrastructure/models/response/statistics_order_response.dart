class StatisticsOrderResponse {
  bool? status;
  String? message;
  StatisticsOrder? data;

  StatisticsOrderResponse({
    this.status,
    this.message,
    this.data,
  });

  StatisticsOrderResponse copyWith({
    bool? status,
    String? message,
    StatisticsOrder? data,
  }) =>
      StatisticsOrderResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory StatisticsOrderResponse.fromJson(Map<String, dynamic> json) =>
      StatisticsOrderResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : StatisticsOrder.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class StatisticsOrder {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;

  dynamic nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  StatisticsOrder({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  StatisticsOrder copyWith({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    dynamic nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      StatisticsOrder(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory StatisticsOrder.fromJson(Map<String, dynamic> json) =>
      StatisticsOrder(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  DateTime? createdAt;
  int? id;
  String? status;
  String? firstname;
  String? lastname;
  int? active;
  String? quantity;
  double? price;
  double? tax;
  String? avgQuantity;
  double? avgPrice;

  Datum({
    this.createdAt,
    this.id,
    this.status,
    this.firstname,
    this.lastname,
    this.active,
    this.quantity,
    this.price,
    this.tax,
    this.avgQuantity,
    this.avgPrice,
  });

  Datum copyWith({
    DateTime? createdAt,
    int? id,
    String? status,
    String? firstname,
    String? lastname,
    int? active,
    String? quantity,
    double? price,
    double? tax,
    String? avgQuantity,
    double? avgPrice,
  }) =>
      Datum(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        status: status ?? this.status,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        active: active ?? this.active,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        tax: tax ?? this.tax,
        avgQuantity: avgQuantity ?? this.avgQuantity,
        avgPrice: avgPrice ?? this.avgPrice,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        status: json["status"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        active: json["active"],
        quantity: json["quantity"],
        price: json["price"]?.toDouble(),
        tax: json["tax"]?.toDouble(),
        avgQuantity: json["avg_quantity"],
        avgPrice: json["avg_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "status": status,
        "firstname": firstname,
        "lastname": lastname,
        "active": active,
        "quantity": quantity,
        "price": price,
        "tax": tax,
        "avg_quantity": avgQuantity,
        "avg_price": avgPrice,
      };
}
