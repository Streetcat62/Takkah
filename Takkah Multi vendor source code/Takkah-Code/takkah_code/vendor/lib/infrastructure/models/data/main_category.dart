
import 'category.dart';

class MainCategoryResponse {
    List<MainCategoryModel>? data;
    Links? links;
    Meta? meta;

    MainCategoryResponse({
        this.data,
        this.links,
        this.meta,
    });

    MainCategoryResponse copyWith({
        List<MainCategoryModel>? data,
        Links? links,
        Meta? meta,
    }) => 
        MainCategoryResponse(
            data: data ?? this.data,
            links: links ?? this.links,
            meta: meta ?? this.meta,
        );

    factory MainCategoryResponse.fromJson(Map<String, dynamic> json) => MainCategoryResponse(
        data: json["data"] == null ? [] : List<MainCategoryModel>.from(json["data"]!.map((x) => MainCategoryModel.fromJson(x))),
        // links: json["links"] == null ? null : Links.fromJson(json["links"]),
        // meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class MainCategoryModel {
    int? id;
    String? uuid;
    int? parentId;
    String? type;
    bool? active;
    DateTime? createdAt;
    DateTime? updatedAt;
    Translation? translation;
    String? keywords;
    String? img;

    MainCategoryModel({
        this.id,
        this.uuid,
        this.parentId,
        this.type,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.translation,
        this.keywords,
        this.img,
    });

    MainCategoryModel copyWith({
        int? id,
        String? uuid,
        int? parentId,
        String? type,
        bool? active,
        DateTime? createdAt,
        DateTime? updatedAt,
        Translation? translation,
        String? keywords,
        String? img,
    }) => 
        MainCategoryModel(
            id: id ?? this.id,
            uuid: uuid ?? this.uuid,
            parentId: parentId ?? this.parentId,
            type: type ?? this.type,
            active: active ?? this.active,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            translation: translation ?? this.translation,
            keywords: keywords ?? this.keywords,
            img: img ?? this.img,
        );

    factory MainCategoryModel.fromJson(Map<String, dynamic> json) => MainCategoryModel(
        id: json["id"],
        uuid: json["uuid"],
        parentId: json["parent_id"],
        type: json["type"],
        active: json["active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
        keywords: json["keywords"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "parent_id": parentId,
        "type": type,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "keywords": keywords,
        "img": img,
    };
}


class Links {
    String? first;
    String? last;
    dynamic prev;
    String? next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    Links copyWith({
        String? first,
        String? last,
        dynamic prev,
        String? next,
    }) => 
        Links(
            first: first ?? this.first,
            last: last ?? this.last,
            prev: prev ?? this.prev,
            next: next ?? this.next,
        );

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    int? currentPage;
    int? from;
    int? lastPage;
    List<Link>? links;
    String? path;
    int? perPage;
    int? to;
    int? total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    Meta copyWith({
        int? currentPage,
        int? from,
        int? lastPage,
        List<Link>? links,
        String? path,
        int? perPage,
        int? to,
        int? total,
    }) => 
        Meta(
            currentPage: currentPage ?? this.currentPage,
            from: from ?? this.from,
            lastPage: lastPage ?? this.lastPage,
            links: links ?? this.links,
            path: path ?? this.path,
            perPage: perPage ?? this.perPage,
            to: to ?? this.to,
            total: total ?? this.total,
        );

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    Link copyWith({
        String? url,
        String? label,
        bool? active,
    }) => 
        Link(
            url: url ?? this.url,
            label: label ?? this.label,
            active: active ?? this.active,
        );

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
