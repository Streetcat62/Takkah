import '../data/user_data.dart';

class LoginResponse {
  LoginResponse({LoginData? data}) {
    _data = data;
  }

  LoginResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  LoginData? _data;

  LoginResponse copyWith({LoginData? data}) =>
      LoginResponse(data: data ?? _data);

  LoginData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class LoginData {
  LoginData({
    String? accessToken,
    String? tokenType,
    String? token,
    UserData? user,
  }) {
    _accessToken = accessToken;
    _tokenType = tokenType;
    _token = token;
    _user = user;
  }

  LoginData.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _token = json['token'];
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  String? _accessToken;
  String? _tokenType;
  String? _token;
  UserData? _user;

  LoginData copyWith({
    String? accessToken,
    String? tokenType,
    String? token,
    UserData? user,
  }) =>
      LoginData(
        accessToken: accessToken ?? _accessToken,
        tokenType: tokenType ?? _tokenType,
        token: token ?? _token,
        user: user ?? _user,
      );

  String? get accessToken => _accessToken;

  String? get tokenType => _tokenType;

  String? get token => _token;

  UserData? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}
