
class OrderCalculate {
    bool? status;
    String? message;
    OrderCalculateDetail? data;

    OrderCalculate({
        this.status,
        this.message,
        this.data,
    });

    OrderCalculate copyWith({
        bool? status,
        String? message,
        OrderCalculateDetail? data,
    }) => 
        OrderCalculate(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory OrderCalculate.fromJson(Map<String, dynamic> json) => OrderCalculate(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : OrderCalculateDetail.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class OrderCalculateDetail {
    List<Product>? products;
    num? productTax;
    num? productTotal;
    num? orderTax;
    num? orderTotal;

    OrderCalculateDetail({
        this.products,
        this.productTax,
        this.productTotal,
        this.orderTax,
        this.orderTotal,
    });

    OrderCalculateDetail copyWith({
        List<Product>? products,
        num? productTax,
        num? productTotal,
        double? orderTax,
        double? orderTotal,
    }) => 
        OrderCalculateDetail(
            products: products ?? this.products,
            productTax: productTax ?? this.productTax,
            productTotal: productTotal ?? this.productTotal,
            orderTax: orderTax ?? this.orderTax,
            orderTotal: orderTotal ?? this.orderTotal,
        );

    factory OrderCalculateDetail.fromJson(Map<String, dynamic> json) => OrderCalculateDetail(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        productTax: json["product_tax"],
        productTotal: json["product_total"],
        orderTax: json["order_tax"]?.toDouble(),
        orderTotal: json["order_total"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "product_tax": productTax,
        "product_total": productTotal,
        "order_tax": orderTax,
        "order_total": orderTotal,
    };
}

class Product {
    num? id;
    num? price;
    num? qty;
    num? tax;
    num? shopTax;
    num? discount;
    num? priceWithoutTax;
    num? totalPrice;

    Product({
        this.id,
        this.price,
        this.qty,
        this.tax,
        this.shopTax,
        this.discount,
        this.priceWithoutTax,
        this.totalPrice,
    });

    Product copyWith({
        num? id,
        num? price,
        num? qty,
        num? tax,
        double? shopTax,
        num? discount,
        num? priceWithoutTax,
        num? totalPrice,
    }) => 
        Product(
            id: id ?? this.id,
            price: price ?? this.price,
            qty: qty ?? this.qty,
            tax: tax ?? this.tax,
            shopTax: shopTax ?? this.shopTax,
            discount: discount ?? this.discount,
            priceWithoutTax: priceWithoutTax ?? this.priceWithoutTax,
            totalPrice: totalPrice ?? this.totalPrice,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        qty: json["qty"],
        tax: json["tax"],
        shopTax: json["shop_tax"]?.toDouble(),
        discount: json["discount"],
        priceWithoutTax: json["price_without_tax"],
        totalPrice: json["total_price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "qty": qty,
        "tax": tax,
        "shop_tax": shopTax,
        "discount": discount,
        "price_without_tax": priceWithoutTax,
        "total_price": totalPrice,
    };
}
