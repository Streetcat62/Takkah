class LocalCart {
  final int productId;
  final int quantity;

  LocalCart({required this.productId, required this.quantity});

  factory LocalCart.fromJson(Map data) {
    return LocalCart(productId: data["p"], quantity: data["q"]);
  }

  Map toJson() {
    return {"p": productId, "q": quantity};
  }
}
