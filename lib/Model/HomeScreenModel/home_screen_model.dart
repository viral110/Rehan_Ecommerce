class DashBoardModel {
  bool? status;
  List<Category>? category;
  List<Banner>? banner;
  List<Product>? product;
  User? user;

  DashBoardModel(
      {this.status, this.category, this.banner, this.product, this.user});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(Banner.fromJson(v));
      });
    }
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Banner {
  int? id;
  int? proId;
  String? featureImage;
  String? createdAt;
  String? updatedAt;

  Banner(
      {this.id, this.proId, this.featureImage, this.createdAt, this.updatedAt});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proId = json['pro_id'];
    featureImage = json['feature_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pro_id'] = proId;
    data['feature_image'] = featureImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Product {
  int? id;
  int? catId;
  String? name;
  String? description;
  String? image1;
  String? image2;
  String? imag3;
  String? image4;
  String? video;
  String? amount;
  String? discount;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.catId,
        this.name,
        this.description,
        this.image1,
        this.image2,
        this.imag3,
        this.image4,
        this.video,
        this.amount,
        this.discount,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    name = json['name'];
    description = json['description'];
    image1 = json['image1'];
    image2 = json['image2'];
    imag3 = json['imag3'];
    image4 = json['image4'];
    video = json['video'];
    amount = json['amount'];
    discount = json['discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cat_id'] = catId;
    data['name'] = name;
    data['description'] = description;
    data['image1'] = image1;
    data['image2'] = image2;
    data['imag3'] = imag3;
    data['image4'] = image4;
    data['video'] = video;
    data['amount'] = amount;
    data['discount'] = discount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? isBlock;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.role,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.isBlock});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isBlock = json['isBlock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['isBlock'] = isBlock;
    return data;
  }
}
