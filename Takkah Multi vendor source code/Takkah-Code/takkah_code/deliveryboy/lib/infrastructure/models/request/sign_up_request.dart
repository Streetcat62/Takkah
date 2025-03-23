class SignUpRequest {
  final String? phone;

  SignUpRequest({
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["phone"] = phone;
    return map;
  }
}
