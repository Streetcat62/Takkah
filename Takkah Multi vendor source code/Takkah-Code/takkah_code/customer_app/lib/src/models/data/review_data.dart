import 'user_data.dart';
import 'gallery_data.dart';

class ReviewData {
  ReviewData({
    int? id,
    int? reviewableId,
    num? rating,
    String? comment,
    String? img,
    String? createdAt,
    String? updatedAt,
    List<GalleryData>? galleries,
    UserData? user,
  }) {
    _id = id;
    _reviewableId = reviewableId;
    _rating = rating;
    _comment = comment;
    _img = img;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _galleries = galleries;
    _user = user;
  }

  ReviewData.fromJson(dynamic json) {
    _id = json['id'];
    _reviewableId = json['reviewable_id'];
    _rating = json['rating'];
    _comment = json['comment'];
    _img = json['img'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['galleries'] != null) {
      _galleries = [];
      json['galleries'].forEach((v) {
        _galleries?.add(GalleryData.fromJson(v));
      });
    }
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  int? _id;
  int? _reviewableId;
  num? _rating;
  String? _comment;
  String? _img;
  String? _createdAt;
  String? _updatedAt;
  List<GalleryData>? _galleries;
  UserData? _user;

  ReviewData copyWith({
    int? id,
    int? reviewableId,
    num? rating,
    String? comment,
    String? img,
    String? createdAt,
    String? updatedAt,
    List<GalleryData>? galleries,
    UserData? user,
  }) =>
      ReviewData(
        id: id ?? _id,
        reviewableId: reviewableId ?? _reviewableId,
        rating: rating ?? _rating,
        comment: comment ?? _comment,
        img: img ?? _img,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        galleries: galleries ?? _galleries,
        user: user ?? _user,
      );

  int? get id => _id;

  int? get reviewableId => _reviewableId;

  num? get rating => _rating;

  String? get comment => _comment;

  String? get img => _img;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<GalleryData>? get galleries => _galleries;

  UserData? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reviewable_id'] = _reviewableId;
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['img'] = _img;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_galleries != null) {
      map['galleries'] = _galleries?.map((v) => v.toJson()).toList();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}
