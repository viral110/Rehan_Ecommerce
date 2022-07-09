class GetProductDetails {
  bool? status;
  Data? data;

  GetProductDetails({this.status, this.data});

  GetProductDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
