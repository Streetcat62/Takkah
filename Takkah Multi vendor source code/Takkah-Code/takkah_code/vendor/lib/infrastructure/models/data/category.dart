
class CategoryResponse {
    List<CategoryModel>? data;
    Links? links;
    Meta? meta;

    CategoryResponse({
        this.data,
        this.links,
        this.meta,
    });

    CategoryResponse copyWith({
        List<CategoryModel>? data,
        Links? links,
        Meta? meta,
    }) => 
        CategoryResponse(
            data: data ?? this.data,
            links: links ?? this.links,
            meta: meta ?? this.meta,
        );

    factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
        data: json["data"] == null ? [] : List<CategoryModel>.from(json["data"]!.map((x) => CategoryModel.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class CategoryModel {
    int? id;
    Category? category;

    CategoryModel({
        this.id,
        this.category,
    });

    CategoryModel copyWith({
        int? id,
        Category? category,
    }) => 
        CategoryModel(
            id: id ?? this.id,
            category: category ?? this.category,
        );

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
    };
}

class Category {
    int? id;
    String? uuid;
    String? keywords;
    int? parentId;
    String? type;
    String? img;
    bool? active;
    DateTime? createdAt;
    DateTime? updatedAt;
    Translation? translation;
    List<Category>? children;

    Category({
        this.id,
        this.uuid,
        this.keywords,
        this.parentId,
        this.type,
        this.img,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.translation,
        this.children,
    });

    Category copyWith({
        int? id,
        String? uuid,
        String? keywords,
        int? parentId,
        String? type,
        String? img,
        bool? active,
        DateTime? createdAt,
        DateTime? updatedAt,
        Translation? translation,
        List<Category>? children,
    }) => 
        Category(
            id: id ?? this.id,
            uuid: uuid ?? this.uuid,
            keywords: keywords ?? this.keywords,
            parentId: parentId ?? this.parentId,
            type: type ?? this.type,
            img: img ?? this.img,
            active: active ?? this.active,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            translation: translation ?? this.translation,
            children: children ?? this.children,
        );

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        uuid: json["uuid"],
        keywords: json["keywords"],
        parentId: json["parent_id"],
        type: json["type"],
        img: json["img"],
        active: json["active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
        children: json["children"] == null ? [] : List<Category>.from(json["children"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "keywords": keywords,
        "parent_id": parentId,
        "type": type,
        "img": img,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x.toJson())),
    };
}

class Translation {
    int? id;
    String? locale;
    String? title;
    String? description;

    Translation({
        this.id,
        this.locale,
        this.title,
        this.description,
    });

    Translation copyWith({
        int? id,
        String? locale,
        String? title,
        String? description,
    }) => 
        Translation(
            id: id ?? this.id,
            locale: locale ?? this.locale,
            title: title ?? this.title,
            description: description ?? this.description,
        );

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        locale: json["locale"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "locale": locale,
        "title": title,
        "description": description,
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
    String? perPage;
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
        String? perPage,
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
