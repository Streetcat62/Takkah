class LocalCart {
  final int productId;
  final int count;

  LocalCart({required this.productId, required this.count});

  factory LocalCart.fromJson(Map data) {
    return LocalCart(productId: data['id'], count: data['count']);
  }

  toJson() {
    return {'id': productId, 'count': count};
  }
}
