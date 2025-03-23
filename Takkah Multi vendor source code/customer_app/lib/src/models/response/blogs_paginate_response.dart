import '../data/meta.dart';
import '../data/blog_data.dart';

class BlogsPaginateResponse {
  BlogsPaginateResponse({List<BlogData>? data, Meta? meta}) {
    _data = data;
    _meta = meta;
  }

  BlogsPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BlogData.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  List<BlogData>? _data;
  Meta? _meta;

  BlogsPaginateResponse copyWith({List<BlogData>? data, Meta? meta}) =>
      BlogsPaginateResponse(data: data ?? _data, meta: meta ?? _meta);

  List<BlogData>? get data => _data;

  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}
